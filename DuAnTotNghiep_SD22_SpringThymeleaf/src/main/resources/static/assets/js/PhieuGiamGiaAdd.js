

    function confirmToggle(checkbox, id) {
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
            changeStatus(id, checkbox.checked);
            Swal.fire(
                'Đã xác nhận!',
                'Trạng thái của phiếu giảm giá đã được thay đổi.',
                'success'
            );
        } else {
            checkbox.checked = !checkbox.checked;
            Swal.fire(
                'Đã hủy!',
                'Hành động của bạn đã bị hủy.',
                'error'
            );
        }
    });
}
// function changeStatus(id, status) {
//     // Write your logic to change the status here
//     console.log(`Change status of ${id} to ${status}`);
// }
// function toggleSwitch(element, id, isChecked) {
//     var url = `/admin/phieu-giam-gia/${id}/delete`; // Đảm bảo rằng id đã được thay thế đúng giá trị
//     var data = { trangThai: isChecked ? 0 : 1 };
//
//     fetch(url, {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json',
//         },
//         body: JSON.stringify(data),
//     })
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error(`HTTP error! Status: ${response.status}`);
//             }
//             alert(`THÀNH CÔNG!!!`);
//         })
//         .catch(error => {
//             console.error('Error updating employee status:', error);
//             // Xử lý lỗi nếu cần thiết
//             alert('LỖI!!!!.');
//             // Đặt lại trạng thái checkbox nếu có lỗi
//             element.checked = !isChecked;
//         });
// }

//     function OnSearchEmployee() {
//         var status = document.getElementById("trangThai").value;
//         var keyword = document.getElementById("searchInput").value;
//         var hinhThucGiam = document.getElementById("hinhThucGiam").value;
//         var ngayBatDau = document.getElementById("ngayBatDau").value;
//         var ngayKetThuc = document.getElementById("ngayKetThuc").value;
//         var obj = {
//             keyword: keyword,
//             trangThai: status != "" ? status : null,
//             hinhThucGiam: hinhThucGiam != "" ? hinhThucGiam : null,
//             page_index: 1,
//             page_size: 5,
//             ngayBatDau: ngayBatDau !== "" ? ngayBatDau : null,
//             ngayKetThuc : ngayKetThuc !== "" ? ngayKetThuc : null
//         }
//
//         console.log(obj);
//
//         searchPhieuGiamGia(obj);
//     }
//
// function searchPhieuGiamGia(obj){
//
// }
// ----
// document.getElementById('confirmButton').addEventListener('click', function() {
//     if (validateForm()) {
//         Swal.fire({
//             title: 'Bạn có chắc chắn thêm phieu giam gia mới?',
//             text: "Bạn không thể hoàn tác hành động này!",
//             icon: 'warning',
//             showCancelButton: true,
//             confirmButtonColor: '#3085d6',
//             cancelButtonColor: '#d33',
//             confirmButtonText: 'Thêm mới'
//         }).then((result) => {
//             if (result.isConfirmed) {
//                 addPgg();
//             }
//         });
//     }
// });
// function addPgg() {
//     const form = document.getElementById('myForm');
//
//     // Thêm lớp 'disabled' và thay đổi văn bản của nút Lưu
//     const confirmButton = document.getElementById('confirmButton');
//     confirmButton.classList.add('disabled');
//
//     axios.get('/admin/SavePhieuGiamGia', new FormData(form) )
//         .then(response => {
//             // Xóa lớp 'disabled' và thay đổi văn bản của nút Lưu khi hoàn thành
//             confirmButton.classList.remove('disabled');
//             confirmButton.textContent = 'Lưu';
//
//             Swal.fire(
//                 'Thành công!',
//                 'Phieu Giam Gia đã được thêm mới.',
//                 'success'
//             ).then(() => {
//                 window.location.href = '/admin/phieu-giam-gia';
//             });
//             console.log(formData)
//         })
//         .catch(error => {
//             // Xóa lớp 'disabled' và thay đổi văn bản của nút Lưu khi có lỗi
//             confirmButton.classList.remove('disabled');
//             confirmButton.textContent = 'Lưu';
//
//             Swal.fire(
//                 'Lỗi!',
//                 'Có lỗi xảy ra khi thêm phieu giam gia.',
//                 'error'
//             );
//         });
// }
// function validateForm() {
//     let valid = true;
//     // Kiểm tra Tên
//     const ten = document.getElementById('ten').value;
//     const tenError = document.getElementById('tenError');
//     if (ten.trim() === '') {
//         tenError.textContent = 'Tên không được để trống.';
//         valid = false;
//     } else {
//         tenError.textContent = '';
//     }
//     return valid;
// }



    document.getElementById('confirmButton').addEventListener('click', function() {
        // Kiểm tra hợp lệ của form bằng hàm validateForm()
        if (validateForm()) {
            Swal.fire({
                title: 'Bạn có chắc chắn thêm phiếu giảm giá mới?',
                text: "Bạn không thể hoàn tác hành động này!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Vâng, tiếp tục!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        'Đã xác nhận!',
                        'Bạn đã thêm 1 phiếu giảm giá  mới.',
                        'success'
                    ).then(() => {
                        add(); // Gọi hàm để xử lý việc gửi form
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
    });

    function add() {
        const form = document.getElementById('myForm');
        axios.post('/admin/SavePhieuGiamGia', new FormData(form))
            .then(function(response) {
                showSuccessMessage();
            })
            .catch(function(error) {
                console.error('Error:', error);
            });
    }

    function showSuccessMessage() {
        const notification = document.getElementById('notification');
        notification.classList.add('show');
        const progressBar = document.getElementById('progress-bar');
        progressBar.style.width = '0';
        setTimeout(function() {
            progressBar.style.width = '100%';
        }, 100);

        setTimeout(function() {
            // Remove the show class after the notification disappears
            notification.classList.remove('show');

            window.location.href = '/admin/phieu-giam-gia';
        }, 3000);
    }
    function validateForm() {
        var ten = document.getElementById('ten').value.trim();



        return isValid;
    }



