cart = document.getElementById('cart')
cart.innerHTML = "<%= j render(@cart) %>"
lineItemRows = cart.querySelectorAll('tr[data-id]').length
if lineItemRows <= 0
  cart.innerHTML = ''
