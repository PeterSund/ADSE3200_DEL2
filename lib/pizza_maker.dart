import 'package:adse3200/models/PizzaObject.dart';
import 'package:adse3200/pizza_maker/topping_selector.dart';
import 'package:adse3200/pizza_maker/topping_selector_double.dart';
import 'package:flutter/material.dart';

import 'design/app_theme.dart';

class PizzaMaker extends StatefulWidget {
  PizzaMaker({Key? key}) : super(key: key);

  @override
  State<PizzaMaker> createState() => _PizzaMakerState();
}

class _PizzaMakerState extends State<PizzaMaker> {
  int _index = 0;
  late bool _hideButtons = true;

  PizzaObject pizza = PizzaObject();

  Map<String, bool> meat = {
    'Pepperoni': false,
    'Biff': false,
    'Kylling': false,
    'Skinke': false,
  };

  Map<String, bool> cheese = {
    'Mozerella': false,
    'Parmesan': false,
    'Gorgonzola': false,
    'Jarlsberg': false,
  };

  Map<String, bool> topping = {
    'Paprika': false,
    'Tomat': false,
    'Rødløk': false,
    'Oliven': false,
    'Aubergine': false,
    'Sopp': false,
  };

  setSize(String size) {
    pizza.size = size;
  }

  setSauce(String sauce) {
    pizza.sauce = sauce;
  }

  setPrice(String price) {
    pizza.price = price;
  }

  increaseIndex() {
    setState(() {
      _index++;
    });
  }

  decreaseIndex() {
    setState(() {
      _index--;
    });
  }

  goToStart() {
    setState(() {
      _index = 0;
    });
  }

  setStepAsActive(int indexFromStep) {
    if (indexFromStep == _index) {
      return true;
    } else {
      return false;
    }
  }

  showSnackBar(String s) {
    var snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(s),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Theme(
          data: ThemeData(
              canvasColor: COLOR_CANVAS_STEPPER,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: ACCENT_COLOR,
                  )),
          child: Stepper(
            type: StepperType.horizontal,
            physics: const ClampingScrollPhysics(),
            //Lagt inn for å gjemme standardknapper i Stepper (kilde: https://errorsfixing.com/how-to-hide-continue-and-cancel-button-on-flutter-stepper/)
            controlsBuilder: ((context, details) {
              return Row(children: const [
                TextButton(
                  onPressed: null,
                  child: Text(''),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(''),
                ),
              ]);
            }),
            currentStep: _index,
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: <Step>[
              Step(
                isActive: setStepAsActive(0),
                title: const Text('Størrelse'),
                content: Column(
                  children: [
                    const Text("Velg størrelse",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Container(
                        margin: const EdgeInsets.only(top: 80),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: COLOR_PIZZACONTAINER,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: IconButton(
                                        constraints:
                                            const BoxConstraints.expand(
                                                width: 80, height: 80),
                                        onPressed: () => {
                                          increaseIndex(),
                                          setSize("Liten pizza"),
                                          setPrice("149 kr")
                                        },
                                        icon: Image.asset(
                                            'assets/images/pizza_size.jpeg'),
                                      )),
                                  const Text(
                                    "Liten 149 kr",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: COLOR_PIZZACONTAINER,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: IconButton(
                                        constraints:
                                            const BoxConstraints.expand(
                                                width: 100, height: 100),
                                        onPressed: () => {
                                          increaseIndex(),
                                          setSize("Medium pizza"),
                                          setPrice("199 kr")
                                        },
                                        icon: Image.asset(
                                            'assets/images/pizza_size.jpeg'),
                                      )),
                                  const Text(
                                    "Medium 199 kr",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: COLOR_PIZZACONTAINER,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: IconButton(
                                        constraints:
                                            const BoxConstraints.expand(
                                                width: 120, height: 120),
                                        onPressed: () => {
                                          increaseIndex(),
                                          setSize("Stor pizza"),
                                          setPrice("249 kr")
                                        },
                                        icon: Image.asset(
                                            'assets/images/pizza_size.jpeg'),
                                      )),
                                  const Text(
                                    "Stor 249 kr",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ]))
                  ],
                ),
              ),
              Step(
                  isActive: setStepAsActive(1),
                  title: const Text("Saus"),
                  content: Column(
                    children: [
                      const Text("Velg type saus",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: COLOR_PIZZACONTAINER,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: IconButton(
                                        constraints:
                                            const BoxConstraints.expand(
                                                width: 100, height: 100),
                                        onPressed: () => {
                                          increaseIndex(),
                                          setSauce("Rød saus")
                                        },
                                        icon: Image.asset(
                                            'assets/images/red_sauce.jpg'),
                                      )),
                                  const Text("Rød saus")
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: COLOR_PIZZACONTAINER,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: IconButton(
                                        constraints:
                                            const BoxConstraints.expand(
                                                width: 100, height: 100),
                                        onPressed: () => {
                                          increaseIndex(),
                                          setSauce("Hvit saus")
                                        },
                                        icon: Image.asset(
                                            'assets/images/white_sauce.jpg'),
                                      )),
                                  const Text("Hvit saus")
                                ],
                              )
                            ]),
                      )
                    ],
                  )),
              Step(
                isActive: setStepAsActive(2),
                title: const Text('Topping'),
                content: Column(
                  children: [
                    ToppingSelector(meat, pizza, "Kjøtt"),
                    ToppingSelector(cheese, pizza, "Ost"),
                  ],
                ),
              ),
              Step(
                isActive: setStepAsActive(3),
                title: const Text('Topping 2'),
                content: Column(
                  children: [
                    ToppingSelectorExtra(topping, pizza, "Topping"),
                  ],
                ),
              ),
              Step(
                isActive: setStepAsActive(4),
                title: const Text('Bestill'),
                content: Column(children: [
                  const Text(
                    "Din bestilling:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 350,
                      height: 190,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: COLOR_PIZZACONTAINER, width: 2),
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text(pizza.showOrder(),
                              style: const TextStyle(fontSize: 16)))),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 50,
                      width: 230,
                      child: ElevatedButton(
                          onPressed: () {
                            showSnackBar("Bestilling sendt");
                            goToStart();
                          },
                          child: const Text("Bestill"))),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 50,
                    width: 230,
                    child: ElevatedButton(
                        onPressed: () {
                          showSnackBar("Lagt til i handlekurv");
                          goToStart();
                        },
                        child: const Text("Legg i handlekurv")),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(150, 20, 150, 50),
        child: Row(children: [
          //Skjuler tilbakeknappen hvis man er på første steg
          IconButton(
            iconSize: 100,
            onPressed: (_index == 0) ? null : () => decreaseIndex(),
            icon: const Icon(Icons.arrow_left_outlined),
          ),
          //"Disabler" framknappen hvis man er på siste steg
          IconButton(
            iconSize: 100,
            onPressed: (_index == 4) ? null : () => increaseIndex(),
            icon: const Icon(Icons.arrow_right_outlined),
          ),
        ]),
      ),
    ]);
  }
}
