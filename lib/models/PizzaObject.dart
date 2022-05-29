class PizzaObject {
  String size = "";
  String sauce = "";
  String price = "";
  List<String> toppings = [];

  String getSize() {
    return size;
  }

  setSize(String s) {
    size = s;
  }

  String getSauce() {
    return sauce;
  }

  setSauce(String s) {
    sauce = s;
  }

  setPrice(String s) {
    price = s;
  }

  List<String> getToppings() {
    return toppings;
  }

  addTopping(String s) {
    if (!toppings.contains(s)) {
      toppings.add(s);
    }
  }

  removeTopping(String s) {
    toppings.remove(s);
  }

  void printPizza() {
    print("1 " + getSize());
    print("2 " + getSauce());
    toppings.forEach((element) {
      print(element);
    });
  }

  removeToppings(String s) {
    toppings.remove(s);
  }

  String showOrder() {
    String s = "";
    int i = 0;
    for (var item in toppings) {
      i++;
      if (i == 1) {
        s += item;
      } else {
        s += ", " + item;
      }
    }
    String string = size +
        ", " +
        sauce +
        '\n\nIngredienser:\n' +
        s +
        '\n\n' +
        "Pris: " +
        price;
    return string;
  }
}
