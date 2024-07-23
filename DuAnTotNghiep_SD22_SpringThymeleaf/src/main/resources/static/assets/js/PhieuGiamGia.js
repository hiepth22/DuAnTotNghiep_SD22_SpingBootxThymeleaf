
//     function confirmToggle(checkbox, id) {
//     Swal.fire({
//         title: 'Bạn có chắc chắn?',
//         text: "Bạn không thể hoàn tác hành động này!",
//         icon: 'warning',
//         showCancelButton: true,
//         confirmButtonColor: '#3085d6',
//         cancelButtonColor: '#dd3333',
//         confirmButtonText: 'Vâng, tiếp tục!',
//         cancelButtonText: 'Hủy'
//     }).then((result) => {
//         if (result.isConfirmed) {
//             changeStatus(id, checkbox.checked);
//             Swal.fire(
//                 'Đã xác nhận!',
//                 'Trạng thái của phiếu giảm giá đã được thay đổi.',
//                 'success'
//             );
//         } else {
//             checkbox.checked = !checkbox.checked;
//             Swal.fire(
//                 'Đã hủy!',
//                 'Hành động của bạn đã bị hủy.',
//                 'error'
//             );
//         }
//     });
// }
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
//
//







