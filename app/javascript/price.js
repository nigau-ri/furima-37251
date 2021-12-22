function price() {
  const itemPrice = document.getElementById('item-price');
  if (!itemPrice) return null;


  itemPrice.addEventListener('keyup', ()=>{
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    const commission = parseInt(itemPrice.value * 0.1);
    addTaxPrice.innerHTML = commission;
    profit.innerHTML = itemPrice.value - commission;
  });
}

window.addEventListener('load', price);