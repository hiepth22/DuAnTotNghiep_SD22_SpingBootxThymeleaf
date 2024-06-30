(function () {
    searchNhanVien("");
})();

function searchNhanVien(keyword,page_index = 1, page_size = 5) {
    console.log(keyword);
    var url = '/admin/nhanvien?keyword='+ encodeURIComponent(keyword);
    console.log(url);
    fetch(url)
        .then(response => response.text())
        .then(data => {
            var tableBody = document.getElementById('fromnv');
            tableBody.innerHTML = data.trim();
        })
        .catch(error => console.error('Error:', error));
}

// Đoạn mã JavaScript để xử lý sự kiện thay đổi switch button và hiển thị tooltip
function toggleSwitch(element, nhanvienId) {
    var isChecked = element.checked; // Lấy giá trị checked của checkbox

    // Hàm hiển thị hộp thoại xác nhận
    function confirmToggle() {
        return new Promise(function(resolve, reject) {
            if (confirm('Bạn có chắc chắn muốn thay đổi trạng thái không?')) {
                resolve();
            } else {
                reject();
            }
        });
    }

    // Gọi hàm xác nhận trước khi gửi yêu cầu ajax
    confirmToggle().then(function() {
        // Gửi yêu cầu ajax để cập nhật trạng thái của nhân viên
        axios.post('/admin/updatetrangthai/' + nhanvienId, {
            trangthai: isChecked ? 0 : 1 // Gửi trạng thái mới (0 hoặc 1)
        })
            .then(function(response) {
                // Xử lý khi cập nhật thành công
                console.log('Cập nhật trạng thái thành công');
            })
            .catch(function(error) {
                // Xử lý khi có lỗi xảy ra
                console.error('Lỗi khi cập nhật trạng thái: ', error);
                // Đảm bảo rằng trạng thái của switch button được giữ nguyên
                element.checked = !isChecked;
            });
    }).catch(function() {
        // Người dùng đã hủy bỏ xác nhận, không thực hiện gì cả
        console.log('Đã hủy bỏ thay đổi trạng thái');
        // Đảm bảo rằng trạng thái của switch button được giữ nguyên
        element.checked = !isChecked;
    });
}

// Hàm để hiển thị tooltip khi hover vào switch button
function showTooltip(element) {
    if (element.checked) {
        element.setAttribute('title', 'Switch is on');
    } else {
        element.removeAttribute('title');
    }
}



// nv add
// function addnv() {
//
//     var url = '/admin/addNhanVien';
//     fetch(url)
//         .then(response => response.text())
//         .then(data => {
//             var tableBody = document.getElementById('conten');
//             tableBody.innerHTML = data.trim();
//         })
//         .catch(error => console.error('Error:', error));
// }
//
// function handleImageChange(input) {
//     if (input.files && input.files[0]) {
//         const reader = new FileReader();
//         reader.onload = function (e) {
//             const previewImage = document.querySelector('.image-placeholder img');
//             previewImage.src = e.target.result;
//             previewImage.style.display = 'block';
//
//             const placeholder = document.querySelector('.image-placeholder span');
//             placeholder.style.display = 'none';
//         };
//         reader.readAsDataURL(input.files[0]);
//     }
// }
// function addnv() {
//
//     var url = '/admin/addNhanVien';
//     fetch(url)
//         .then(response => response.text())
//         .then(data => {
//             var tableBody = document.getElementById('fromnv');
//             tableBody.innerHTML = data.trim();
//         })
//         .catch(error => console.error('Error:', error));
// }