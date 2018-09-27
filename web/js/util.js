$(function () {
    console.log(checkPhone(12312131212));
})

function checkPhone(phone) {
    var regex = /^[1][3,4,5,7,8,9][0-9]{9}$/;
    if (regex.test(phone)) {
        return true;
    }
    return false;
}
