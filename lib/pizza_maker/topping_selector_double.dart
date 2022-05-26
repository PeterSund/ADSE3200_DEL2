import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/58275465/how-to-make-multiple-checkbox-in-flutter-dynamically-and-get-their-values-togeth

// ignore: must_be_immutable
class ToppingSelectorExtra extends StatefulWidget {
  late Map<String, bool> optionsList;
  String title;

  ToppingSelectorExtra(this.optionsList, this.title, {Key? key}) : super(key: key) {
    optionsList = this.optionsList;
  }

  @override
  _ToppingSelectorExtraState createState() => _ToppingSelectorExtraState();
}

class _ToppingSelectorExtraState extends State<ToppingSelectorExtra> {
  late final Map<String, bool> _optionsList = widget.optionsList;

  var holder_1 = [];

  getItems() {
    _optionsList.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 10), child: Text(widget.title)),
        const Divider(color: Colors.black),
        Container(
          height: 500,
          width: 800,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: _optionsList.keys.map((String key) {
              return SizedBox(
                width: 50,
                height: 50,
                child: CheckboxListTile(
                  title: Text(key),
                  value: _optionsList[key],
                  activeColor: Colors.deepPurple[400],
                  checkColor: Colors.white,
                  onChanged: (bool? value) {
                    setState(() {
                      _optionsList[key] = value as bool;
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
