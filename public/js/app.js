function add_to_basket(id)
{
var key = 'product_'+id;
var x = localStorage.getItem(key);
x = x * 1 + 1;
localStorage.setItem(key, x);
upd_cnt();
upd_order();
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
     return sum;
}

function order()
{
var orders ='';
for (var i = 0; i < localStorage.length; i++){
var key = localStorage.key(i);
if (key.indexOf("product_") == 0) {
     var x = localStorage.getItem(key);
				   }
     orders += key+'-'+x+',';
					     }
return orders;
}


function upd_cnt() {
text = 'Корзина ('+ summa()+')';
$("#basket").text(text);
};

function upd_order() {
$('#order').val(order());
};

function del_orders() {
localStorage.clear();
upd_cnt();
upd_order();
$('#hidden').text("Ваша корзина пуста!")
}