function price() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup', () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(itemPrice.value*0.1);
    profit.innerHTML = itemPrice.value - Math.floor(itemPrice.value*0.1);
  }); 
};

window.addEventListener('load', price);
