App.blackjack = App.cable.subscriptions.create "BlackjackChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) -> 
    # Called when there's incoming data on the websocket for this channel
    if data.content == "clear\n"
      $('#term_demo').terminal().clear()
      $('#term_demo').terminal().resume()
    else if data.content == "resume\n"
      $('#term_demo').terminal().resume()
    else
      $('#term_demo').terminal().echo data.content
      $('#term_demo').terminal().resume()