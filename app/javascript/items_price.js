if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){ 
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input',() => {
    const inputValue = priceInput.value;
    const tax = 0.1
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * tax);
    const profitDom = document.getElementById("profit")
    profitDom.innerHTML = Math.floor(priceInput.value * 0.9);
  });
  });
}