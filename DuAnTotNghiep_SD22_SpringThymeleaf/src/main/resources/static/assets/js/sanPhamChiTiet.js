document.addEventListener('DOMContentLoaded', function () {
    const priceRange = document.getElementById('priceRange');
    const minPrice = document.getElementById('minPrice');
    const maxPrice = document.getElementById('maxPrice');
    const priceDisplay = document.getElementById('priceDisplay');

    const minRange = 0;
    const maxRange = 25;
    const minValue = 0;
    const maxValue = 5000000;
    const stepValue = 200000;

    function formatCurrency(value) {
        return value.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
    }

    function updateDisplay(value) {
        const displayValue = value * stepValue;
        minPrice.textContent = formatCurrency(displayValue);
        maxPrice.textContent = formatCurrency(maxValue);
        priceDisplay.textContent = `${formatCurrency(displayValue)} - ${formatCurrency(maxValue)}`;
    }

    priceRange.addEventListener('input', function () {
        updateDisplay(priceRange.value);
    });

    updateDisplay(priceRange.value);
});