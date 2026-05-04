const itemPrice = () => {
  const priceInput = document.getElementById('item-price');
  if (!priceInput) return;

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value, 10);
    const tax = Math.floor(price * 0.1);
    const profit = Math.floor(price - tax);

    const addTaxPrice = document.getElementById('add-tax-price');
    const profitEl = document.getElementById('profit');

    if (isNaN(price)) {
      addTaxPrice.textContent = '';
      profitEl.textContent = '';
    } else {
      addTaxPrice.textContent = tax;
      profitEl.textContent = profit;
    }
  });
};

window.addEventListener('turbo:load', itemPrice);