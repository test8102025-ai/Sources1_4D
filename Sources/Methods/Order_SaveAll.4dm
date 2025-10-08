// Project/Sources/Methods/Order_SaveAll.4dm
var $o : cs.Order
$o:=cs.Order.new()
$o.addItem("P001"; 2)
var $t : Number
$t:=$o.total()
