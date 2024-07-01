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

        $('#sizeModal').modal('hide');
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

        $('#colorModal').modal('hide');
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
    inputElement.addEventListener('input', function () {
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
    const moTa = document.getElementById('moTa').value;

    const selectedColors = Array.from(document.querySelectorAll('#selectedColors .selected-item')).map(item => item.textContent);
    const selectedSizes = Array.from(document.querySelectorAll('#selectedSizes .selected-item')).map(item => item.textContent);

    const chiTietSanPhams = [];
    selectedColors.forEach(mauSac => {
        selectedSizes.forEach(kichCo => {
            const chiTietSanPham = {
                sanPham,
                coGiay,
                deGiay,
                chatLieu,
                nhaSanXuat,
                moTa,
                mauSac,
                kichCo,
                ngayTao: new Date(),
                canNang: 500,
                giaBan: 1000000
            };
            chiTietSanPhams.push(chiTietSanPham);
        });
    });

    const productDetailsContainer = document.getElementById('productDetails');
    productDetailsContainer.innerHTML = '';

    const colorGroups = chiTietSanPhams.reduce((groups, product) => {
        const { mauSac } = product;
        if (!groups[mauSac]) {
            groups[mauSac] = [];
        }
        groups[mauSac].push(product);
        return groups;
    }, {});

    for (const [mauSac, products] of Object.entries(colorGroups)) {
        const colorTitle = document.createElement('h5');
        colorTitle.classList.add('mt-3');
        colorTitle.textContent = `Danh sách sản phẩm có màu ${mauSac}`;
        productDetailsContainer.appendChild(colorTitle);

        const table = document.createElement('table');
        table.classList.add('table', 'table-bordered');

        table.innerHTML = `
        <thead>
            <tr>
                <th scope="col" style="width: 20%">Tên sản phẩm</th>
                <th scope="col" style="width: 15%">Màu</th>
                <th scope="col" style="width: 15%">Kích cỡ</th>
                <th scope="col" style="width: 15%">Cổ giày</th>
                <th scope="col" style="width: 15%">Đế</th>
                <th scope="col" style="width: 15%">Cân nặng</th>
                <th scope="col" style="width: 15%">Giá bán</th>
                <th scope="col" style="width: 15%">Ngày tạo</th>
                <th scope="col" style="width: 15%">Upload ảnh</th>
            </tr>
        </thead>
        <tbody>
    `;

        products.forEach(product => {
            const row = document.createElement('tr');
            row.innerHTML = `
            <td style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">${product.sanPham}</td>
            <td>${product.mauSac}</td>
            <td>${product.kichCo}</td>
            <td>${product.coGiay}</td>
            <td>${product.deGiay}</td>
            <td><input type="text" value="${product.canNang}" class="form-control" style="width: 80px;"></td>
            <td><input type="text" value="${product.giaBan}" class="form-control" style="width: 120px;"></td>
            <td>${product.ngayTao ? new Date(product.ngayTao).toLocaleDateString() : ''}</td>
            <th class="image"></th>
        `;
            table.querySelector('tbody').appendChild(row);
        });

        const uploadRow = document.createElement('tr');
        uploadRow.innerHTML = `
        <td rowspan="${products.length}">
            <form>
                <input type="file" class="form-control-file">
                <button type="submit" class="btn btn-primary btn-sm mt-1">Upload ảnh</button>
            </form>
        </td>
    `;
        table.querySelector('th.image').appendChild(uploadRow);

        productDetailsContainer.appendChild(table);
    }

    const saveButton = document.createElement('button');
    saveButton.textContent = 'Lưu sản phẩm';
    saveButton.classList.add('btn', 'btn-primary', 'mt-3', 'mb-3');
    productDetailsContainer.appendChild(saveButton);
});