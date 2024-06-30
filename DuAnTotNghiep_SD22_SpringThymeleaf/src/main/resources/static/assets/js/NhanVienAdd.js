// // HTML:
// // Thêm thẻ script để include Axios
// <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
//
// // JavaScript:
// var cities = document.getElementById("city");
// var districts = document.getElementById("district");
// var wards = document.getElementById("ward");
//
// var Parameter = {
//     url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
//     method: "GET",
//     responseType: "json", // Sửa từ "application/json" thành "json"
// };
//
// axios(Parameter)
//     .then(function(response) {
//         renderCity(response.data);
//     })
//     .catch(function(error) {
//         console.error("Error fetching data: ", error);
//     });
//
// function renderCity(data) {
//     // Lặp qua dữ liệu và thêm các tùy chọn cho select city
//     for (const city of data) {
//         cities.options[cities.options.length] = new Option(city.Name, city.Id);
//     }
//
//     cities.onchange = function() {
//         // Xóa các tùy chọn hiện tại của select district và ward, giữ lại tùy chọn mặc định
//         districts.length = 1;
//         wards.length = 1;
//
//         // Lọc dữ liệu để lấy ra quận huyện của thành phố được chọn
//         const selectedCity = data.find(item => item.Id === this.value);
//         if (selectedCity) {
//             // Thêm các tùy chọn cho select district
//             for (const district of selectedCity.Districts) {
//                 districts.options[districts.options.length] = new Option(district.Name, district.Id);
//             }
//         }
//     };
//
//     districts.onchange = function() {
//         // Xóa các tùy chọn hiện tại của select ward, giữ lại tùy chọn mặc định
//         wards.length = 1;
//
//         // Lấy ra danh sách các phường xã của quận huyện được chọn
//         const selectedCity = data.find(item => item.Id === cities.value);
//         if (selectedCity) {
//             const selectedDistrict = selectedCity.Districts.find(item => item.Id === this.value);
//             if (selectedDistrict) {
//                 // Thêm các tùy chọn cho select ward
//                 for (const ward of selectedDistrict.Wards) {
//                     wards.options[wards.options.length] = new Option(ward.Name, ward.Id);
//                 }
//             }
//         }
//     };
// }

function handleImageChange(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const previewImage = document.querySelector('.image-placeholder img');
            previewImage.src = e.target.result;
            previewImage.style.display = 'block';

            const placeholder = document.querySelector('.image-placeholder span');
            placeholder.style.display = 'none';
        };
        reader.readAsDataURL(input.files[0]);
    }
}