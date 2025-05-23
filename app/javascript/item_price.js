// item_price.js
window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value);
    if (!isNaN(price)) {
      const tax = Math.floor(price * 0.1);
      const profit = price - tax;
      addTaxDom.innerText = tax;
      profitDom.innerText = profit;
    } else {
      addTaxDom.innerText = '';
      profitDom.innerText = '';
    }
  });
});