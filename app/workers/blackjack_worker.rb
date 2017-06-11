require 'net/ssh'

# Accesses my C++ Blackjack game deployed on ec2 Linux
# instance by SSH connection. Input from jcubic 
# terminal sent via post request, output from Linux
# sent back to terminal via ActionCable channel 
# broadcast. Sidekiq::Worker allows class 
# to run on its own thread on Redis instance.

class BlackjackWorker
  include Sidekiq::Worker
  sidekiq_options retry: false


  #class variables
  @@input = nil
  @@host = ENV["EC2_HOST"]
  @@user = ENV["EC2_USER"]
  @@password = ENV["EC2_PASSWORD"]
  @@running = false


  # initiates all threads from Blackjack controller
  def perform(args = nil)
    puts args

    # if args.downcase == "start" && !@@running
    #   playGame
    #   @@running = false
    #   @@input = nil
    #   clearConsole
    #   sleep(0.2)
    #   broadcast("Goodbye! Type 'start' to restart Blackjack.")
    # elsif args.downcase == "start" && @@running
    #   clearConsole
    #   sleep(0.2)
    #   broadcast("Process still running, try again in a minute.")
    # else
    #   setInput(args)
    # end    
  end


  # private methods
  private

    # sets input class variable
    def setInput(string)
      if !@@running
        @@input = nil
        resumeTerminal
        return
      end

      if string == nil
        @@input = nil
      elsif string == "\n"
        @@input = "\n"
      else
        @@input = string + "\n"
      end
    end


    # waits for input from terminal
    def getUserInput()
      setInput(nil)
      resumeTerminal
      count = 0
      while @@input == nil do 
        sleep(0.5)
        # playGame terminates after 60 idle seconds
        count += 1
        if count >= 120
          broadcast("Connection timed out")
          @@running = false
          return
        end
      end
    end


    def resumeTerminal()
      ActionCable.server.broadcast 'blackjack_channel', content: "resume\n"
    end


    def clearConsole()
      ActionCable.server.broadcast 'blackjack_channel', content: "clear\n"
    end


    # broadcasts to blackjack channel / terminal
    def broadcast(content)
      if content.include? "[3;J[H[2J"
        content = content.sub("[3;J[H[2J", "")
        clearConsole
        sleep(0.2)
      end
      ActionCable.server.broadcast 'blackjack_channel', content: content
    end


    # tests to see if string is empty,
    # meaning at least one alphachar (not \r\n)
    def isEmpty(data)
      if (data =~ /\d/) # number
        false
      elsif (data =~ /[a-zA-Z]/) # alphachar
        false
      else
        true
      end
    end


    # main method, creates SSH session
    def playGame()

      @@running = true
      setInput(nil)
      ipt = "chompedinput"

      broadcast("logging in ...")

      # Login to ec2, start SSH session
      Net::SSH.start(@@host, @@user, password: @@password) do |session|

        broadcast("logged in!")
        broadcast("obtaining pseudo terminal ...")

        # Start the channel
        session.open_channel do |channel|

          # Get pseudo terminal
          channel.request_pty do |ch, success|
            if success
              broadcast("pty successfully obtained!")
              ch.exec("./a.out")
            else
              broadcast("could not obtain pty")
            end
          end

          # Main loop
          # When channel has data via pty, print it
          channel.on_data do |ch, data|

            # allows for PTY data to buffer properly
            sleep(0.5)

            # Handler 1: Remove echoed input
            if ((@@input != "\n") && (data.include? ipt))
              if (!data.include?("Quit"))
                data = data.sub(ipt, "")
              end
            end

            # Handler 2: Check if data is empty, avoid extra user keystrokes
            if data.include?("out of money")
              broadcast("#{data}")
              getUserInput
            elsif (isEmpty(data) && @@input != "\n")
              setInput("\n")       
            elsif (!isEmpty(data) && (@@input == "\n"))
              broadcast("#{data}")
              if data.include?("does not have")
                getUserInput
              end
            else
              if (!isEmpty(data))
                broadcast("#{data}")
              end
              getUserInput
            end 

            ipt = @@input
            if ipt != nil
              ipt = ipt.chomp
            end

            # When 2 is entered at main menu, trigger channel/sesion close
            if ((ipt == "2" || ipt == 2) && (data.include? "Enter your selection (1-2)")) || (!@@running)
              setInput("\n")
              channel.close()
              sleep(0.2)
            end

            channel.send_data(@@input) # Send input to PTY            

          end # end on_data loop
        end # end channel block
        session.loop # Repeat session if processes running
        session.close()
        puts "session.close called"
      end # end SSH session
    end # end method playGame
end # end class