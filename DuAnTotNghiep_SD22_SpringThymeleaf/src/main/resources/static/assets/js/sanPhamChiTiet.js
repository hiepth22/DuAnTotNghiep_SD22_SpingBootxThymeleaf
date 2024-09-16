function formatCurrency(value) {
    if (!value) return '';
    return Number(value).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }).replace('₫', ' VNĐ');
}

function validatePriceInput(event) {
    const input = event.target;
    let value = input.value;

    value = value.replace(/[^0-9]/g, '');

    input.value = formatCurrency(value);

    const price = value.replace(/,/g, '');

    if (isNaN(price) || price === '') {
        input.value = '';
    }
}

function validatePriceRange() {
    const minPriceInput = document.getElementById('minPriceInput');
    const maxPriceInput = document.getElementById('maxPriceInput');
    const minPriceError = document.getElementById('minPriceError');
    const maxPriceError = document.getElementById('maxPriceError');

    const minPrice = parseFloat(minPriceInput.value.replace(/[^0-9.]/g, ''));
    const maxPrice = parseFloat(maxPriceInput.value.replace(/[^0-9.]/g, ''));

    minPriceError.textContent = '';
    maxPriceError.textContent = '';

    const MAX_PRICE = 10000000;
    const MIN_PRICE = 5000000;

    if (minPrice > MIN_PRICE) {
        minPriceError.textContent = `Giá tối thiểu không được vượt quá ${formatCurrency(MIN_PRICE)}.`;
        minPriceInput.value = formatCurrency(MIN_PRICE);
    }

    if (maxPrice > MAX_PRICE) {
        maxPriceError.textContent = `Giá tối đa không được vượt quá ${formatCurrency(MAX_PRICE)}.`;
        maxPriceInput.value = formatCurrency(MAX_PRICE);
    }

    if (minPrice < 0) {
        minPriceError.textContent = 'Giá tối thiểu không được âm.';
    }
    if (maxPrice < 0) {
        maxPriceError.textContent = 'Giá tối đa không được âm.';
    }

    if (minPrice > maxPrice) {
        minPriceError.textContent = 'Giá tối thiểu không được lớn hơn giá tối đa.';
    }

    if (maxPrice < minPrice) {
        maxPriceError.textContent = 'Giá tối đa không được nhỏ hơn giá tối thiểu.';
    }
}

document.getElementById('minPriceInput').addEventListener('input', function(event) {
    validatePriceInput(event);
    validatePriceRange();
});

document.getElementById('maxPriceInput').addEventListener('input', function(event) {
    validatePriceInput(event);
    validatePriceRange();
});
