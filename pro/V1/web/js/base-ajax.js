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

function baseSend2(url) {

    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }

    try {
      
        request.open("POST", url, true);
        request.send();
        window.location.reload(true);
    } catch (e) {
        alert("Cannot create ajax request");
    }
}

function addToCart() {
    //var productid = document.addcartform.idproduct.value;
    var quantity = document.getElementById("quantity").value;
    //  var url = "addcart?productid=" + id;
    console.log(quantity);
    var action = "AddtoCart";
    var url = "controller?action=" + action + "&quantity=" + quantity;
    console.log(url);
    console.log(5 + 6);
    baseSend(url, getCartInfo);
}

function rating(start, ID_product) {
    //var productid = document.addcartform.idproduct.value;
    // var quantity = document.getElementById("quantity").value;
    //  var url = "addcart?productid=" + id;
    // console.log(quantity);
    var action = "rating";
    var url = "controller?action=" + action + "&start=" + start +"&ID_product="+ID_product;
    console.log(url);
    console.log(5 + 6);
    baseSend(url, getRateInfo);
}

function comment1(ID_product) {
    var comment = document.myform1.comment.value;
    // var quantity = document.getElementById("quantity").value;
    //  var url = "addcart?productid=" + id;
    // console.log(quantity);
    var action = "comment";
    var url = "controller?action=" + action + "&comment=" + comment +"&ID_product="+ID_product;
    console.log(url);
    //console.log(5 + 6);
    baseSend2(url);
}



function getcommentInfo() {
   
}



function getCartInfo() {
    if (request.readyState === 4) {
        var val = "Added to cart";
        document.getElementById("cart-msg").innerHTML = val;
    }
}



function getRateInfo() {
    if (request.readyState === 4 || request.readyState === 200 ) {
        var val = "Rated";
        document.getElementById("rating-msg").innerHTML = val;
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