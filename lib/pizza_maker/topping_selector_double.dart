import 'package:adse3200/design/app_theme.dart';
import 'package:flutter/material.dart';

import '../models/PizzaObject.dart';

//https://stackoverflow.com/questions/58275465/how-to-make-multiple-checkbox-in-flutter-dynamically-and-get-their-values-togeth

// ignore: must_be_immutable
class ToppingSelectorExtra extends StatefulWidget {
  late Map<String, bool> optionsList;
  late PizzaObject pizza;
  String title;

  ToppingSelectorExtra(this.optionsList, this.pizza, this.title, {Key? key})
      : super(key: key) {
    pizza = this.pizza;
    optionsList = this.optionsList;
  }

  @override
  _ToppingSelectorExtraState createState() => _ToppingSelectorExtraState();
}

class _ToppingSelectorExtraState extends State<ToppingSelectorExtra> {
  late final Map<String, bool> _optionsList = widget.optionsList;
  late PizzaObject _pizza = widget.pizza;

  var holder_1 = [];

  getItems() {
    _optionsList.forEach((key, value) {
      if (value == true) {
        _pizza.addTopping(key);
      } else {
        _pizza.removeTopping(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
        const Divider(color: ACCENT_COLOR),
        Container(
          height: 400,
          width: 600,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: _optionsList.keys.map((String key) {
              return SizedBox(
                width: 50,
                height: 50,
                child: CheckboxListTile(
                  title: Text(key, style: const TextStyle(fontSize: 18),),
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
