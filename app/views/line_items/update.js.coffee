# Render newly updated cart info
cart = document.getElementById('cart')
cart.innerHTML = "<%= j render(@cart) %>"
# If newly updated cart is empty, hide from naviagtion bar notify User
lineItemRows = cart.querySelectorAll('tr[data-id]').length
if lineItemRows <= 0
  cart.innerHTML = ''
  notice = '<aside id="notice">Your Cart is Empty</aside>';
  document.querySelector('article').innerHTML = notice;
