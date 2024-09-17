const colorPicker = document.getElementById('colorPicker');
const tenMauSac = document.getElementById('tenMauSac');

colorPicker.addEventListener('input', function() {
    tenMauSac.value = colorPicker.value;
});

function confirmAndSave(modalId, apiUrl, formData, successCallback, errorCallback, contentType = 'application/json') {
    Swal.fire({
        title: 'Bạn có chắc chắn?',
        text: "Bạn không thể hoàn tác hành động này!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Vâng, tiếp tục!',
        cancelButtonText: 'Hủy'
    }).then((result) => {
        if (result.isConfirmed) {
            let body;
            let headers = {
                'Content-Type': contentType
            };

            if (contentType === 'application/json') {
                body = JSON.stringify(formData);
            } else if (contentType === 'application/x-www-form-urlencoded') {
                body = new URLSearchParams(formData).toString();
            } else {
                console.error('Unsupported content type:', contentType);
                if (errorCallback) errorCallback('Định dạng dữ liệu không được hỗ trợ.');
                return;
            }

            fetch(apiUrl, {
                method: 'POST',
                headers: headers,
                body: body
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        const modal = bootstrap.Modal.getInstance(document.getElementById(modalId));
                        modal.hide();
                        if (successCallback) successCallback();

                        Swal.fire(
                            'Thành công!',
                            'Dữ liệu đã được lưu.',
                            'success'
                        );
                    } else {
                        if (errorCallback) errorCallback(data.message);
                    }
                })
                .catch(error => {
                    console.error('Lỗi:', error);
                    if (errorCallback) errorCallback('Có lỗi xảy ra.');
                });
        } else {
            Swal.fire(
                'Đã hủy!',
                'Hành động của bạn đã bị hủy.',
                'error'
            );
        }
    });
}


document.getElementById('btnLuuSanPham').addEventListener('click', function () {
    var tenSanPham = document.getElementById('tenSanPham').value.trim();
    var thuongHieuId = document.getElementById('thuongHieu').value;
    var tenSanPhamError = document.getElementById('tenSanPhamError');
    var thuongHieuError = document.getElementById('thuongHieuError');

    tenSanPhamError.textContent = '';
    tenSanPhamError.style.display = 'none';
    thuongHieuError.textContent = '';
    thuongHieuError.style.display = 'none';

    if (!tenSanPham) {
        tenSanPhamError.textContent = 'Vui lòng nhập tên sản phẩm.';
        tenSanPhamError.style.display = 'block';
        return;
    }

    if (!thuongHieuId) {
        thuongHieuError.textContent = 'Vui lòng chọn thương hiệu.';
        thuongHieuError.style.display = 'block';
        return;
    }

    const formData = {
        ten: tenSanPham,
        thuongHieuId: thuongHieuId
    };

    confirmAndSave(
        'themMoiSanPham',
        '/admin/san-pham/add',
        formData,
        function () {
            updateSanPhamSelect();
            document.getElementById('tenSanPham').value = '';
            document.getElementById('thuongHieu').value = '';
        },
        function (message) {
            tenSanPhamError.textContent = message;
            tenSanPhamError.style.display = 'block';
        }
    );
});


function updateSanPhamSelect() {
    fetch('/admin/san-pham/all-status')
        .then(response => response.json())
        .then(sanPhams => {
            const sanPhamSelect = document.getElementById('sanPham');
            sanPhamSelect.innerHTML = '<option selected>Chọn sản phẩm</option>';

            sanPhams.forEach(sanPham => {
                const option = document.createElement('option');
                option.value = sanPham.id;
                option.textContent = sanPham.ten;
                sanPhamSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Lỗi khi cập nhật danh sách sản phẩm:', error);
        });
}

document.getElementById('btnLuuCoGiay').addEventListener('click', function () {
    var tenCoGiay = document.getElementById('tenCoGiay').value.trim();
    var errorElement = document.getElementById('tenCoGiayError');

    errorElement.textContent = '';
    errorElement.style.display = 'none';

    if (!tenCoGiay) {
        errorElement.textContent = 'Vui lòng nhập tên cổ giày.';
        errorElement.style.display = 'block';
        return;
    }

    const formData = {
        ten: tenCoGiay
    };

    confirmAndSave(
        'themMoiCoGiay',
        '/api/co-giay/add',
        formData,
        function () {
            updateCoGiaySelect();
            document.getElementById('tenCoGiay').value = '';
        },
        function (message) {
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        },
        'application/x-www-form-urlencoded'
    );
});


function updateCoGiaySelect() {
    fetch('/api/co-giay/all-status')
        .then(response => response.json())
        .then(coGiays => {
            const coGiaySelect = document.getElementById('coGiay');
            coGiaySelect.innerHTML = '<option selected>Chọn cổ giày</option>';

            coGiays.forEach(coGiay => {
                const option = document.createElement('option');
                option.value = coGiay.id;
                option.textContent = coGiay.ten;
                coGiaySelect.appendChild(option);
            });
        });
}


document.getElementById('btnLuuDeGiay').addEventListener('click', function () {
    var tenDeGiay = document.getElementById('tenDeGiay').value.trim();
    var errorElement = document.getElementById('tenDeGiayError');

    errorElement.textContent = '';
    errorElement.style.display = 'none';

    if (!tenDeGiay) {
        errorElement.textContent = 'Vui lòng nhập tên đế giày.';
        errorElement.style.display = 'block';
        return;
    }

    const formData = {
        ten: tenDeGiay
    };

    confirmAndSave(
        'themMoiDeGiay',
        '/api/de-giay/add',
        formData,
        function () {
            updateDeGiaySelect();
            document.getElementById('tenDeGiay').value = '';
        },
        function (message) {
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        },
        'application/x-www-form-urlencoded'
    );
});


function updateDeGiaySelect() {
    fetch('/api/de-giay/all-status')
        .then(response => response.json())
        .then(deGiays => {
            const deGiaySelect = document.getElementById('deGiay');
            deGiaySelect.innerHTML = '<option selected>Chọn đế giày</option>';

            deGiays.forEach(deGiay => {
                const option = document.createElement('option');
                option.value = deGiay.id;
                option.textContent = deGiay.ten;
                deGiaySelect.appendChild(option);
            });
        });
}

document.getElementById('btnLuuChatLieu').addEventListener('click', function () {
    var tenChatLieu = document.getElementById('tenChatLieu').value.trim();
    var errorElement = document.getElementById('tenChatLieuError');

    errorElement.textContent = '';
    errorElement.style.display = 'none';

    if (!tenChatLieu) {
        errorElement.textContent = 'Vui lòng nhập tên chất liệu.';
        errorElement.style.display = 'block';
        return;
    }

    const formData = {
        ten: tenChatLieu
    };

    confirmAndSave(
        'themMoiChatLieu',
        '/api/chat-lieu/add',
        formData,
        function () {
            updateChatLieuSelect();
            document.getElementById('tenChatLieu').value = '';
        },
        function (message) {
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        },
        'application/x-www-form-urlencoded'
    );
});


function updateChatLieuSelect() {
    fetch('/api/chat-lieu/all-status')
        .then(response => response.json())
        .then(chatLieus => {
            const chatLieuSelect = document.getElementById('chatLieu');
            chatLieuSelect.innerHTML = '<option selected>Chọn chất liệu</option>';

            chatLieus.forEach(chatLieu => {
                const option = document.createElement('option');
                option.value = chatLieu.id;
                option.textContent = chatLieu.ten;
                chatLieuSelect.appendChild(option);
            });
        });
}

document.getElementById('btnLuuNSX').addEventListener('click', function () {
    var tenNSX = document.getElementById('tenNSX').value.trim();
    var errorElement = document.getElementById('tenNSXError');

    errorElement.textContent = '';
    errorElement.style.display = 'none';

    if (!tenNSX) {
        errorElement.textContent = 'Vui lòng nhập tên nhà sản xuất.';
        errorElement.style.display = 'block';
        return;
    }

    const formData = {
        ten: tenNSX
    };

    confirmAndSave(
        'themMoiNSX',
        '/api/nsx/add',
        formData,
        function () {
            updateNSXSelect();
            document.getElementById('tenNSX').value = '';
        },
        function (message) {
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        },
        'application/x-www-form-urlencoded'
    );
});


function updateNSXSelect() {
    fetch('/api/nsx/all-status')
        .then(response => response.json())
        .then(nsx => {
            const nsxSelect = document.getElementById('nhaSanXuat');
            nsxSelect.innerHTML = '<option selected>Chọn nhà sản xuất</option>';

            nsx.forEach(nsxs => {
                const option = document.createElement('option');
                option.value = nsxs.id;
                option.textContent = nsxs.ten;
                nsxSelect.appendChild(option);
            });
        });
}

document.getElementById('saveColor').addEventListener('click', function () {
    var tenMauSac = document.getElementById('tenMauSac').value.trim();
    var moTaMauSac = document.getElementById('moTaMauSac').value.trim();
    var errorElement = document.getElementById('tenMauSacError');
    var moTaErrorElement = document.getElementById('moTaMauSacError');

    errorElement.textContent = '';
    errorElement.style.display = 'none';

    if (!tenMauSac) {
        errorElement.textContent = 'Vui lòng nhập tên màu sắc.';
        errorElement.style.display = 'block';
        return;
    }

    if (!moTaMauSac) {
        moTaErrorElement.textContent = 'Vui lòng nhập mô tả màu sắc.';
        moTaErrorElement.style.display = 'block';
        return;
    }

    if (moTaMauSac.length > 30) {
        moTaErrorElement.textContent = 'Mô tả không được vượt quá 30 ký tự.';
        moTaErrorElement.style.display = 'block';
        return;
    }

    const formData = new URLSearchParams();
    formData.append('ten', tenMauSac);
    formData.append('moTa', moTaMauSac);

    confirmAndSave(
        'addMauSac',
        '/api/mau-sac/add',
        formData,
        function () {
            updateMauSacModal();
            document.getElementById('tenMauSac').value = '';
            document.getElementById('moTaMauSac').value = '';
        },
        function (message) {
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        },
        'application/x-www-form-urlencoded'
    );
});

function updateMauSacModal() {
    fetch('/api/mau-sac/all-status')
        .then(response => response.json())
        .then(mauSacs => {
            const mauSacList = document.getElementById('colorList');
            mauSacList.innerHTML = '';

            mauSacs.forEach(mauSac => {
                const item = document.createElement('div');
                item.className = 'col-3 mb-3';
                item.innerHTML = `
                    <div class="form-check d-flex align-items-center">
                        <input class="form-check-input" type="checkbox"
                               value="${mauSac.id}"
                               data-color="${mauSac.ten}"
                               id="color_${mauSac.id}">
                        <label class="form-check-label color-container" for="color_${mauSac.id}">
                            <span class="color-box" style="background-color: ${mauSac.ten};"></span>
                        </label>
                    </div>
                `;
                mauSacList.appendChild(item);
            });
        })
        .catch(error => {
            console.error('Lỗi khi cập nhật danh sách màu sắc:', error);
        });
}

document.getElementById('saveKichCo').addEventListener('click', function () {
    var tenKichCo = document.getElementById('tenKichCo').value.trim();
    var errorElement = document.getElementById('tenKichCoError');

    errorElement.textContent = '';
    errorElement.style.display = 'none';

    if (!tenKichCo) {
        errorElement.textContent = 'Vui lòng nhập tên kích cỡ.';
        errorElement.style.display = 'block';
        return;
    }

    var invalidChars = /[^0-9.,]/;
    if (invalidChars.test(tenKichCo)) {
        errorElement.textContent = 'Không được chứa ký tự đặc biệt và chữ cái.';
        errorElement.style.display = 'block';
        return;
    }

    var tenKichCoValue = parseFloat(tenKichCo);
    if (isNaN(tenKichCoValue)) {
        errorElement.textContent = 'Tên kích cỡ phải là số.';
        errorElement.style.display = 'block';
        return;
    }

    if (tenKichCoValue < 30) {
        errorElement.textContent = 'Kích cỡ phải lớn hơn hoặc bằng 30.';
        errorElement.style.display = 'block';
        return;
    }

    if (tenKichCoValue > 50) {
        errorElement.textContent = 'Kích cỡ phải nhỏ hơn hoặc bằng 50.';
        errorElement.style.display = 'block';
        return;
    }

    const formData = new URLSearchParams();
    formData.append('ten', tenKichCo);

    confirmAndSave(
        'addKichCo',
        '/api/kich-co/add',
        formData,
        function () {
            updateKichCoModal();
            document.getElementById('tenKichCo').value = '';
        },
        function (message) {
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        },
        'application/x-www-form-urlencoded'
    );
});
function updateKichCoModal() {
    fetch('/api/kich-co/all-status')
        .then(response => response.json())
        .then(kichCos => {
            const kichCoList = document.getElementById('sizeList');
            kichCoList.innerHTML = '';

            kichCos.forEach(kichCo => {
                const col = document.createElement('div');
                col.className = 'col-2 mb-3';
                col.innerHTML = `
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox"
                               value="${kichCo.id}"
                               data-size="${kichCo.ten}"
                               id="size_${kichCo.id}">
                        <label class="form-check-label" for="size_${kichCo.id}">
                            ${kichCo.ten}
                        </label>
                    </div>
                `;

                kichCoList.appendChild(col);
            });
        })
        .catch(error => {
            console.error('Lỗi khi cập nhật danh sách kích cỡ:', error);
        });
}

