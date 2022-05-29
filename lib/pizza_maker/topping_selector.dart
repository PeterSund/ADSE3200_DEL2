import 'package:adse3200/design/app_theme.dart';
import 'package:adse3200/models/PizzaObject.dart';
import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/58275465/how-to-make-multiple-checkbox-in-flutter-dynamically-and-get-their-values-togeth

// ignore: must_be_immutable
class ToppingSelector extends StatefulWidget {
  late Map<String, bool> optionsList;
  late PizzaObject pizza;
  String title;

  ToppingSelector(this.optionsList, this.pizza, this.title, {Key? key})
      : super(key: key) {
    optionsList = this.optionsList;
    pizza = this.pizza;
  }

  @override
  _ToppingSelectorState createState() => _ToppingSelectorState();
}

class _ToppingSelectorState extends State<ToppingSelector> {
  late final Map<String, bool> _optionsList = widget.optionsList;
  late final PizzaObject _pizza = widget.pizza;

  getItems() {
    _optionsList.forEach((key, value) {
      if (value == true) {
        _pizza.addTopping(key);
      }
      else {
        _pizza.removeTopping(key);
      }
    });

    // Printing all selected items on Terminal screen.

    // Here you will get all your selected Checkbox items.

    // Clear array after use.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
        const Divider(color: ACCENT_COLOR),
        Container(
          height: 50,
          width: 800,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: _optionsList.keys.map((String key) {
              return SizedBox(
                width: 160,
                height: 10,
                child: CheckboxListTile(
                  title: Text(key, style: const TextStyle(fontSize: 16)),
                  value: _optionsList[key],
                  activeColor: ACCENT_COLOR,
                  checkColor: Colors.white,
                  onChanged: (bool? value) {
                    setState(() {
                      _optionsList[key] = value as bool;
                      getItems();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
