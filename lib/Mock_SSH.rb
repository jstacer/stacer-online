class Mock_SSH
  #include BlackjackHelper

  attr_accessor :isRunning

  def initialize()
    @input = nil
    @output = "enter your string"
    @outputArray = []
  end

  @@instance = Mock_SSH.new


  # class method to retrieve singleton instance
  def self.instance
    return @@instance
  end


  def getInput(string)
    @input = string
  end


  def startMock()
    self.isRunning = true
    while @input != "exit" do
      # wait for input
      while @input == nil do sleep(0.3) end
      @outputArray.push(input)
      @input = nil
    end
    self.isRunning = false
  end

  private_class_method :new
end # end class

