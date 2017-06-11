class BlackjackChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "blackjack_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #puts data + "is being spoken!"
  end
end
