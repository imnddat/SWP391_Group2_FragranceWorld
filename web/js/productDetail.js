function updatePrice(element) {
    var price = element.getAttribute('price');
    document.getElementById('field-price').innerHTML = '$' + price; // Update field with $ sign
    document.getElementById('field-price').setAttribute('value', price); // Update field with $ sign

//    var priceInput = document.getElementById('field-price');
    var priceHiddenInput = document.getElementById('price');
//    var priceValue = priceInput.value;
    // Gán giá trị của số lượng cho thẻ hidden
    priceHiddenInput.value = price;
//
    var volumeInput = element.value;
    var volumeHiddenInput = document.getElementById('volume');
    // Gán giá trị của số lượng cho thẻ hidden
    volumeHiddenInput.value = volumeInput;
}

var qtyInput = document.getElementById('qty');
var quantityHiddenInput = document.getElementById('quantity');


// Lắng nghe sự kiện "input" của thẻ input số lượng
qtyInput.addEventListener('input', function () {
    // Lấy giá trị của số lượng từ thẻ input
    var quantityValue = qtyInput.value;

    // Gán giá trị của số lượng cho thẻ hidden
    quantityHiddenInput.value = quantityValue;
});
