import 'package:adse3200/models/PizzaObject.dart';
import 'package:adse3200/pizza_maker/extra_selector.dart';
import 'package:adse3200/pizza_maker/topping_selector.dart';
import 'package:adse3200/pizza_maker/topping_selector_double.dart';
import 'package:adse3200/topbar.dart';
import 'package:flutter/material.dart';

import 'drawer_menu.dart';
import 'shopping_cart.dart';

class PizzaMaker extends StatefulWidget {
  PizzaMaker({Key? key}) : super(key: key);

  @override
  State<PizzaMaker> createState() => _PizzaMakerState();
}

class _PizzaMakerState extends State<PizzaMaker> {
  int _index = 0;
  late bool _hideButtons = true;

  
  PizzaObject pizza = new PizzaObject();

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

  void updatePizza() {
    meat.forEach((key, value) {
      if (value) {
        pizza.addTopping(key);
      }
    });

    cheese.forEach((key, value) {
      if (value) {
        pizza.addTopping(key);
      }
    });

    topping.forEach((key, value) {
      if (value) {
        pizza.addTopping(key);
      }
    });
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
      _index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
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
              title: const Text('Størrelse'),
              content: Container(
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      offset: Offset(0, 5),
                                    )
                                  ]),
                              child: IconButton(
                                constraints: const BoxConstraints.expand(
                                    width: 80, height: 80),
                                onPressed: () => increaseIndex(),
                                icon: Image.asset(
                                    'assets/images/pizza_size.jpeg'),
                              )),
                          const Text("Liten 100 kr")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      offset: Offset(0, 5),
                                    )
                                  ]),
                              child: IconButton(
                                constraints: const BoxConstraints.expand(
                                    width: 80, height: 80),
                                onPressed: () => increaseIndex(),
                                icon: Image.asset(
                                    'assets/images/pizza_size.jpeg'),
                              )),
                          const Text("Liten 100 kr")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      offset: Offset(0, 5),
                                    )
                                  ]),
                              child: IconButton(
                                constraints: const BoxConstraints.expand(
                                    width: 80, height: 80),
                                onPressed: () => increaseIndex(),
                                icon: Image.asset(
                                    'assets/images/pizza_size.jpeg'),
                              )),
                          const Text("Liten 100 kr")
                        ],
                      ),
                    ]),
              ),
            ),
            Step(
                title: Text("Saus"),
                content: Container(
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
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        offset: Offset(0, 5),
                                      )
                                    ]),
                                child: IconButton(
                                  constraints: const BoxConstraints.expand(
                                      width: 80, height: 80),
                                  onPressed: () => increaseIndex(),
                                  icon: Image.asset(
                                      'assets/images/pizza_size.jpeg'),
                                )),
                            const Text("Rød")
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        offset: Offset(0, 5),
                                      )
                                    ]),
                                child: IconButton(
                                  constraints: const BoxConstraints.expand(
                                      width: 80, height: 80),
                                  onPressed: () => increaseIndex(),
                                  icon: Image.asset(
                                      'assets/images/pizza_size.jpeg'),
                                )),
                            const Text("Hvit")
                          ],
                        )
                      ]),
                )),
            Step(
              title: const Text('Topping'),
              content: Column(
                children: [
                  ToppingSelector(meat, "Kjøtt"),
                  ToppingSelector(cheese, "Ost"),
                ],
              ),
            ),
            Step(
              title: const Text('Topping 2'),
              content: Column(
                children: [
                  ToppingSelectorExtra(topping, "Topping"),
                ],
              ),
            ),
            Step(
              title: const Text('Bestill'),
              content: Column(children: const [
                Text("Din bestilling"),
                ElevatedButton(onPressed: null, child: Text("Bestill!"))
              ]),
            ),
          ],
        ),
      ),
      Container(
        child: Row(children: [
          Visibility(
              //Skjuler tilbakeknappen hvis man er på første steg
              visible: (_index != 0),
              child: IconButton(
                onPressed: () => {
                  decreaseIndex(),
                  updatePizza(),
                },
                icon: const Icon(Icons.arrow_left_outlined),
              )),
          Visibility(
            //Skjuler framknappen hvis man er på siste steg
            visible: (_index != 4),
            child: IconButton(
                onPressed: () => {
                  increaseIndex(),
                  updatePizza(),
                },
                icon: const Icon(Icons.arrow_right_outlined)),
          )
        ]),
      )
    ]);
  }
}
