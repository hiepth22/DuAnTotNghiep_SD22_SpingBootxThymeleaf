$(document).ready(function() {
    $('#saveSizes').click(function() {
        var selectedSizes = [];
        $('#sizeList input:checked').each(function() {
            var sizeCheckbox = $(this);
            var sizeName = sizeCheckbox.next('label').text();
            selectedSizes.push({
                name: sizeName,
                checkbox: sizeCheckbox
            });
        });

        displaySelectedItems(selectedSizes, '#selectedSizes');

        $('#sizeModal').modal('hide'); // Sửa thành $('#sizeModal').hide();
    });

    $('#saveColors').click(function() {
        var selectedColors = [];
        $('#colorList input:checked').each(function() {
            var colorCheckbox = $(this);
            var colorName = colorCheckbox.next('label').text();
            selectedColors.push({
                name: colorName,
                checkbox: colorCheckbox
            });
        });

        displaySelectedItems(selectedColors, '#selectedColors');

        $('#colorModal').modal('hide'); // Sửa thành $('#colorModal').hide();
    });

    function displaySelectedItems(items, containerId) {
        var selectedItemsContainer = $(containerId);
        selectedItemsContainer.empty();

        items.forEach(function(item) {
            var itemWrapper = $('<div class="selected-item"></div>');
            var itemLabel = $('<label>' + item.name + '</label>');

            itemWrapper.append(itemLabel);
            selectedItemsContainer.append(itemWrapper);
        });
    }
});



function setupDatalistValidation(inputId, datalistId) {
    var inputElement = document.getElementById(inputId);
    inputElement.addEventListener('input', function() {
    var inputText = this.value.toLowerCase();
    var options = document.getElementById(datalistId).options;
    for (var i = 0; i < options.length; i++) {
    var optionText = options[i].value.toLowerCase();
    if (optionText.indexOf(inputText) !== -1) {
    this.setCustomValidity('');
    return;
}
}
    this.setCustomValidity('Vui lòng chọn một giá trị từ danh sách.');
});
}
    setupDatalistValidation('sanPhamInput', 'sanPhamList');
    setupDatalistValidation('coGiayInput', 'coGiayList');
    setupDatalistValidation('deGiayInput', 'deGiayList');
    setupDatalistValidation('chatLieuInput', 'chatLieuList');
    setupDatalistValidation('nhaSanXuatInput', 'nhaSanXuatList');

    document.querySelector('.create-product-btn').addEventListener('click', function () {
    const sanPham = document.getElementById('sanPhamInput').value;
    const coGiay = document.getElementById('coGiayInput').value;
    const deGiay = document.getElementById('deGiayInput').value;
    const chatLieu = document.getElementById('chatLieuInput').value;
    const nhaSanXuat = document.getElementById('nhaSanXuatInput').value;
    const moTaSanPham = document.getElementById('moTaSanPham').value;

    const selectedColors = Array.from(document.querySelectorAll('#selectedColors .selected-item')).map(item => item.textContent);
    const selectedSizes = Array.from(document.querySelectorAll('#selectedSizes .selected-item')).map(item => item.textContent);

    const chiTietSanPhams = [];
    selectedColors.forEach(color => {
    selectedSizes.forEach(size => {
    const chiTietSanPham = {
    sanPham,
    coGiay,
    deGiay,
    chatLieu,
    nhaSanXuat,
    moTaSanPham,
    color,
    size
};
    chiTietSanPhams.push(chiTietSanPham);
});
});


    const productDetailsContainer = document.getElementById('productDetails');
        productDetailsContainer.innerHTML = ''; // Xóa nội dung cũ trước khi thêm mới

        const table = document.createElement('table');
        table.classList.add('table', 'table-bordered', 'table-hover');
        table.innerHTML = `
        <thead>
            <tr>
                <th scope="col">Tên</th>
                <th scope="col">Màu sắc</th>
                <th scope="col">Kích cỡ</th>
            </tr>
        </thead>
        <tbody>
    `;

        chiTietSanPhams.forEach(product => {
            const row = document.createElement('tr');
            row.innerHTML = `
            <td>${product.sanPham}</td>
            <td>${product.color}</td>
            <td>${product.size}</td>
        `;
            table.appendChild(row);
        });

        table.innerHTML += `
        </tbody>
    `;

        productDetailsContainer.appendChild(table);
});



