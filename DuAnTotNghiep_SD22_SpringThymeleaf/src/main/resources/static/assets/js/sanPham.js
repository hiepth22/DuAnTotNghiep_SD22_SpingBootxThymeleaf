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

    fetch('/admin/san-pham/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            ten: tenSanPham,
            thuongHieuId: thuongHieuId
        })
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const modal = bootstrap.Modal.getInstance(document.getElementById('themMoiSanPham'));
                modal.hide();

                updateSanPhamSelect();

                document.getElementById('tenSanPham').value = '';
                document.getElementById('thuongHieu').value = '';
            } else {
                tenSanPhamError.textContent = data.message;
                tenSanPhamError.style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Lỗi:', error);
            tenSanPhamError.textContent = 'Có lỗi xảy ra.';
            tenSanPhamError.style.display = 'block';
        });
});

function updateSanPhamSelect() {
    fetch('/admin/san-pham/all')
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

    fetch('/api/co-giay/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            'ten': tenCoGiay
        })
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const modal = bootstrap.Modal.getInstance(document.getElementById('themMoiCoGiay'));
                modal.hide();

                updateCoGiaySelect();

                document.getElementById('tenCoGiay').value = '';
            } else {
                errorElement.textContent = data.message;
                errorElement.style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Lỗi:', error);
            errorElement.textContent = 'Có lỗi xảy ra.';
            errorElement.style.display = 'block';
        });
});

function updateCoGiaySelect() {
    fetch('/api/co-giay/all')
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

    fetch('/api/de-giay/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            'ten': tenDeGiay
        })
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const modal = bootstrap.Modal.getInstance(document.getElementById('themMoiDeGiay'));
                modal.hide();

                updateDeGiaySelect();

                document.getElementById('tenDeGiay').value = '';
            } else {
                errorElement.textContent = data.message;
                errorElement.style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Lỗi:', error);
            errorElement.textContent = 'Có lỗi xảy ra.';
            errorElement.style.display = 'block';
        });
});

function updateDeGiaySelect() {
    fetch('/api/de-giay/all')
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

    fetch('/api/chat-lieu/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            'ten': tenChatLieu
        })
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const modal = bootstrap.Modal.getInstance(document.getElementById('themMoiChatLieu'));
                modal.hide();

                updateChatLieuSelect();

                document.getElementById('tenChatLieu').value = '';
            } else {
                errorElement.textContent = data.message;
                errorElement.style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Lỗi:', error);
            errorElement.textContent = 'Có lỗi xảy ra.';
            errorElement.style.display = 'block';
        });
});

function updateChatLieuSelect() {
    fetch('/api/chat-lieu/all')
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

    fetch('/api/nsx/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            'ten': tenNSX
        })
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const modal = bootstrap.Modal.getInstance(document.getElementById('themMoiNSX'));
                modal.hide();

                updateNSXSelect();

                document.getElementById('tenNSX').value = '';
            } else {
                errorElement.textContent = data.message;
                errorElement.style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Lỗi:', error);
            errorElement.textContent = 'Có lỗi xảy ra.';
            errorElement.style.display = 'block';
        });
});

function updateNSXSelect() {
    fetch('/api/nsx/all')
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




