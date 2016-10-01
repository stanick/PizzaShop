function add_to_basket(id)
{
var key = 'product_'+id;
var x = localStorage.getItem(key);
x = x * 1 + 1;
localStorage.setItem(key, x);
alert (x);
}

function summa()
{
var sum = 0;
for (var i = 0; i < localStorage.length; i++){
var key = localStorage.key(i);
if (key.indexOf("product_") == 0) {
     var x = localStorage.getItem(key);
     sum = sum + x * 1;
}

}
     alert (sum);
}


