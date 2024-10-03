
//1
class Item {
String name= "";
double price = 0;
double discount; // discount initalization ( i did not have time to complite it )

Item(this.name, this.price, [this.discount = 0.0]);

double getDiscountedPrice() {
  return price * (1 - discount / 100);
}
String displayItem(String name, double price) 
{
   return "the $name is for $price dolar";
}}

//2

class ItemStock {
  Item item;
  int stock;
  ItemStock(this.item, this.stock);

bool isInStock() {
return stock > 0;
}
    }
  
//3


class VendingMachine {
  List<ItemStock> items = [];
  double balance = 0;

 
  void addItem(Item item, int stock) {
    items.add(ItemStock(item, stock));
    print("${item.name} with stock of $stock ");
  }


  void selectItem(String itemName) {
 for (var itemStock in items) {
 if (itemStock.item.name == itemName) {
 if (itemStock.isInStock()) {
  print("Item selected: ${itemStock.item.name} is avalable");
  } else {
  print("${itemStock.item.name} is out of stock");
 }}
}
   
    print("Item $itemName not found");
  }

  void insertMoney(double amount) {
   if (amount > 0) {
      balance = balance + amount;
  print("the money $amount dolar is added Current balance: $balance dolar");
    } else {
  print("enter a valid answer");
    }
  }

  void dispenseItem(String itemName) {
    for (var itemStock in items) {
      if (itemStock.item.name == itemName) {
  if (!itemStock.isInStock()) {
     print("${itemStock.item.name} is out of stock");
    return;
        }
  if (balance >= itemStock.item.price) {
balance =balance - itemStock.item.price;
print("the item ${itemStock.item.name} is droped");
   print("remaining balance: $balance");
 } else {
 print("not enogh money the ${itemStock.item.name} costs ${itemStock.item.price} dolars");
 }
 }
    }
    print("$itemName is out for you");
  }

  void getChange() {
    if (balance > 0) {
    print('change: $balance');
   } else {
  print("no remaining");
    }
  }


    void displayRemainingStock() {
    print("remaining stock");
    for (var itemStock in items) {
      print("${itemStock.item.name}: ${itemStock.stock} remaining");
    }
  }
  
  
}

void main() {

    print("             welcome");
  VendingMachine machine = VendingMachine();

 
  machine.addItem(Item("water" ,2.50), 10);
  machine.addItem(Item("egg", 1.50), 5);
  machine.addItem(Item("candy", 1.00), 3); 


  machine.insertMoney(5.00);  
  machine.dispenseItem("candy");
  machine.getChange();
 machine.displayRemainingStock();

 
  print("thank you for shoping");
}