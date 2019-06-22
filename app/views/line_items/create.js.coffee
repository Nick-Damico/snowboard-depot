cart = document.getElementById('cart')
cart.innerHTML = "<%= j render(@cart) %>"

notice = document.querySelector('#notice')
if notice
  notice.style.display = 'none'
