(function () {
    searchKH("");
})();

function searchKH(keyword,page_index = 1, page_size = 5) {
    console.log(keyword);
    var url = '/admin/search-khach-hang?keyword='+ encodeURIComponent(keyword);
    console.log(url);
    fetch(url)
        .then(response => response.text())
        .then(data => {
            var tableBody = document.getElementById('formkh');
            tableBody.innerHTML = data.trim();
        })
        .catch(error => console.error('Error:', error));
}
//nv add
// function addnv() {
//
//     var url = '/admin/addNhanVien';
//     fetch(url)
//         .then(response => response.text())
//         .then(data => {
//             var tableBody = document.getElementById('Formadd');
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