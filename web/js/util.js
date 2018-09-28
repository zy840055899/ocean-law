$(function () {
    console.log(checkIDCard("32070419930230103p"));
})

/** 手机号码校验 */
function checkPhone(phone) {
    var regex = /^[1][3,4,5,7,8,9][0-9]{9}$/;
    if (regex.test(phone)) {
        return true;
    }
    return false;
}

/** 身份证号校验 */
function checkIDCard(idCard) {
    var regex = /^[1-9]\d{5}(18|19|2([0-9]))\d{2}(0[0-9]|10|11|12)([0-2][1-9]|30|31)\d{3}[0-9Xx]$/;
    if (regex.test(idCard)) {
        return true;
    }
    return false;
}
