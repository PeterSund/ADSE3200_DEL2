class PizzaObject {
  
  late String size;
  late String sauce;
  late List<String> toppings;

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

  List<String> getToppings() {
    return toppings;
  }

  addToppings(String s) {
    toppings.add(s);
  }

  removeToppings(String s) {
    toppings.remove(s);
  }
}
