
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");

    var Parameter = {
    url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
    method: "GET",
    responseType: "json",
};

    // Gửi request lấy dữ liệu
    axios(Parameter).then(function (response) {
    renderCity(response.data);
}).catch(function (error) {
    console.error('Error fetching data: ', error);
});

    function renderCity(data) {
    data.forEach(function (city) {
        citis.options[citis.options.length] = new Option(city.Name, city.Id);
    });

    citis.onchange = function () {
    clearOptions(districts);
    clearOptions(wards);

    var selectedCity = data.find(function (city) {
    return city.Id === citis.value;
});

    if (selectedCity) {
    selectedCity.Districts.forEach(function (district) {
    districts.options[districts.options.length] = new Option(district.Name, district.Id);
});
}

    updateHiddenFields();
};

    districts.onchange = function () {
    clearOptions(wards);

    var selectedCity = data.find(function (city) {
    return city.Id === citis.value;
});

    if (selectedCity) {
    var selectedDistrict = selectedCity.Districts.find(function (district) {
    return district.Id === districts.value;
});

    if (selectedDistrict) {
    selectedDistrict.Wards.forEach(function (ward) {
    wards.options[wards.options.length] = new Option(ward.Name, ward.Id);
});
}
}

    updateHiddenFields();
};

    wards.onchange = function () {
    updateHiddenFields();
};
}

    function clearOptions(selectElement) {
    for (var i = selectElement.options.length - 1; i > 0; i--) {
    selectElement.remove(i);
}
}

    function updateHiddenFields() {
    var selectedCity = citis.options[citis.selectedIndex];
    var selectedDistrict = districts.options[districts.selectedIndex];
    var selectedWard = wards.options[wards.selectedIndex];

    document.querySelector("input[name='thanhPho']").value = selectedCity ? selectedCity.text : "";
    document.querySelector("input[name='quanHuyen']").value = selectedDistrict ? selectedDistrict.text : "";
    document.querySelector("input[name='phuongXa']").value = selectedWard ? selectedWard.text : "";
}

    function validateForm() {
    var isValid = true;
    var ten = document.getElementById('ten').value.trim();
    var city = document.getElementById('city').value;
    var district = document.getElementById('district').value;
    var ward = document.getElementById('ward').value;

    if (ten === "") {
    document.getElementById('tenError').innerText = "Tên không được để trống.";
    isValid = false;
} else {
    document.getElementById('tenError').innerText = "";
}

    if (city === "" || district === "" || ward === "") {
    document.getElementById('dcError').innerText = "Vui lòng chọn đầy đủ địa chỉ.";
    isValid = false;
} else {
    document.getElementById('dcError').innerText = "";
}

    return isValid;
}

    document.getElementById('confirmButtonupdate').addEventListener('click', function () {
    if (validateForm()) {
    Swal.fire({
    title: 'Bạn có chắc chắn muốn thay đổi địa chỉ?',
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
    'Thành Công!',
    'Bạn đã thay đổi thông tin địa chỉ.',
    'success'
    ).then(() => {
    // Hiển thị thông báo thành công
    showSuccessMessageUpdate();

    // Gửi biểu mẫu sau khi thông báo thành công đã được hiển thị
    document.getElementById('myForm').submit();
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

    function showSuccessMessageUpdate() {
    const notification = document.getElementById('notification1');
    notification.classList.add('show1');
    const progressBar = document.getElementById('progress-bar1');
    progressBar.style.width = '0';
    setTimeout(function () {
    progressBar.style.width = '100%';
}, 100);

    setTimeout(function () {
    notification.classList.remove('show1');
}, 3000);
}
