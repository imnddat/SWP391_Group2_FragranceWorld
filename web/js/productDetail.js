 function updatePrice(element) {
        document.getElementById('field-price').innerHTML = '$' + element.innerHTML; // Update field with $ sign
        document.getElementById('field-price').setAttribute('value', element.value); // Update field with $ sign
        var dis = document.getElementById('field-discount');
        dis.innerHTML = '$' + element.innerHTML * Number(dis.getAttribute('value')); // Update field with $ sign
}