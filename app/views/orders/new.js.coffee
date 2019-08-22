storeDiv = document.querySelector('.store')
storeDiv.innerHTML = "<%= j render(partial: 'form', locals: { order: @order }) %>"

checkoutBtn = document.querySelector('.checkout')
checkoutBtn.value = 'Processing Order'
checkoutBtn.style.backgroundColor = 'grey'
checkoutBtn.disabled = true
