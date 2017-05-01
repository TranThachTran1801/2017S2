var request;

function baseSend(url, getFunction) {

    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }

    try {
        request.onreadystatechange = getFunction;
        request.open("POST", url, true);
        request.send();
    } catch (e) {
        alert("Cannot create ajax request");
    }
}

function addToCart() {
    var productid = document.addcartform.idproduct.value;
    var url = "addcart?productid=" + productid;

    baseSend(url, getCartInfo);
}

function getCartInfo() {
    if (request.readyState === 4) {
        var val = request.responseText;
        document.getElementById("cart-msg").innerHTML = val;
    }
}

function activateAccount() {
    var allCheckBoxes = document.getElementsByName("activatedCheckbox");
    var checkedBoxes = [];

    for (var i = 0; i < allCheckBoxes.length; i++) {
        if (allCheckBoxes[i].checked) {
            checkedBoxes.push(allCheckBoxes[i].value);
        }
    }

    var url = "activateaccount?";
    var parameter = "accountId=";
    var and = "&";

    if (checkedBoxes.length === 0) {
        return false;
    }

    for (var i = 0; i < checkedBoxes.length; i++) {
        url = url.concat(parameter.concat(checkedBoxes[i]));
        url = url.concat(and);

        var row = document.getElementById(checkedBoxes[i]);
        row.parentNode.removeChild(row);
    }

    baseSend(url, getActivateAccountInfo);
}

function getActivateAccountInfo() {
    if (request.readyState === 4) {
        var val = request.responseText;
    }
}

function processOrder() {
    var allCheckBoxes = document.getElementsByName("orderCheckboxConfirm");
    var checkedBoxes = [];

    for (var i = 0; i < allCheckBoxes.length; i++) {
        if (allCheckBoxes[i].checked) {
            checkedBoxes.push(allCheckBoxes[i].value);
        }
    }

    var url = "processOrder?";
    var parameter = "orderId=";
    var and = "&";

    if (checkedBoxes.length === 0) {
        return false;
    }

    for (var i = 0; i < checkedBoxes.length; i++) {
        url = url.concat(parameter.concat(checkedBoxes[i]));
        url = url.concat(and);

        var row = document.getElementById(checkedBoxes[i]);
        row.parentNode.removeChild(row);
    }
    
    baseSend(url, getProcessOrderInfo);
}

function getProcessOrderInfo() {
    if (request.readyState === 4) {
        var val = request.responseText;
    }
}

function updateMyCart() {
    baseSend("updateCart", getUpdateCartInfo);
}

function getUpdateCartInfo() {
    if (request.readyState === 4) {
        var val = request.responseText;
        document.getElementById("cart-content").innerHTML = val;
    }
}