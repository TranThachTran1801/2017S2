function isEmailValidate(email) {

    if (email.includes("@") === true) {
        var prefix = email.split("@")[1];

        return prefix.includes(".") === true ? true : false;
    }

    return false;
}

function takeQuantity(quantity, priceId) {
    var quantitys = document.getElementById(quantity).value;

    var myPrice = document.getElementById(priceId).value;
    var currentTotalCost = document.getElementById("total-cost-hidden").value;

    var qtityVSprice = quantitys * myPrice;
    var qtityVSpriceId = priceId.substring(0, priceId.length - 1);
    
    var myTotalCost = parseFloat(currentTotalCost) + parseFloat((qtityVSprice - myPrice));
    
    document.getElementById("total-cost-hidden").value = myTotalCost.toString();
    document.getElementById(qtityVSpriceId).innerHTML = qtityVSprice;
    document.getElementById("total-cost").innerHTML = myTotalCost;

}
