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

  addTopping(String s) {
    printPizza();
    for (String option in toppings) {
      if (s != option) {
        toppings.add(s);
        
      }
     
    }
  }

  void printPizza() {
    toppings.forEach((element) {
      print(element);
    });
  }

  removeToppings(String s) {
    toppings.remove(s);
  }
}
