(function () {
    searchPGG("");
})();

function searchPGG(keyword,page_index = 1, page_size = 5) {
    console.log(keyword);
    var url = '/admin/search-phieu-giam-gia?keyword='+ encodeURIComponent(keyword);
    console.log(url);
    fetch(url)
        .then(response => response.text())
        .then(data => {
            var tableBody = document.getElementById('formpgg');
            tableBody.innerHTML = data.trim();
        })
        .catch(error => console.error('Error:', error));
}

function validateForm() {
    let isValid = true;

    // Validate required fields
    document.querySelectorAll('input[required], textarea[required]').forEach(input => {
        if (!input.value.trim()) {
            isValid = false;
            input.classList.add('is-invalid');
            input.nextElementSibling.style.display = 'block';
        } else {
            input.classList.remove('is-invalid');
            input.nextElementSibling.style.display = 'none';
        }
    });


    // Validate ma (Mã )
    const ma = document.getElementsByName('ma')[0];
    if (!ma.value.trim()) {
        isValid = false;
        ma.classList.add('is-invalid');
        ma.nextElementSibling.style.display = 'block';
    } else {
        ma.classList.remove('is-invalid');
        ma.nextElementSibling.style.display = 'none';
    }




    return isValid;
}

