App.products = App.cable.subscriptions.create "ProductsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    document.querySelector("main.store").innerHTML = data.html
    # Highlight updated item
    item = document.querySelector('[data-item="' + data.product_id + '"')
    item.classList.add('highlight')
