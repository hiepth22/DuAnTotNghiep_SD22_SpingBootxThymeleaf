document.addEventListener('DOMContentLoaded', function () {
    const btnLuuSanPham = document.getElementById('btnLuuSanPham');

    btnLuuSanPham.addEventListener('click', function () {
        const tenSanPham = document.getElementById('tenSanPham').value;
        const thuongHieuId = document.getElementById('thuongHieu').value;

        if (!tenSanPham || !thuongHieuId) {
            alert('Vui lòng nhập đầy đủ thông tin.');
            return;
        }

        fetch('/admin/san-pham/add', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                ten: tenSanPham,
                thuongHieuId: thuongHieuId
            })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Sản phẩm đã được lưu thành công.');
                    window.location.reload();
                } else {
                    alert('Có lỗi xảy ra: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Lỗi:', error);
                alert('Có lỗi xảy ra.');
            });
    });
});

document.getElementById('btnLuuCoGiay').addEventListener('click', function() {
    var tenCoGiay = document.getElementById('tenCoGiay').value;

    fetch('/api/co-giay/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            'ten': tenCoGiay
        })
    })
        .then(response => response.text())
        .then(data => {
            if (data === "Cổ giày đã được thêm mới") {
                alert(data);
                window.location.reload();
            } else {
                alert(data);
            }
        });
});

