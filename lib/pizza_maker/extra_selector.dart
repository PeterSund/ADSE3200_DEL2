import 'package:flutter/material.dart';

class ExtraCheckbox extends StatefulWidget {
  @override
  ExtraCheckboxState createState() => new ExtraCheckboxState();
}

class ExtraCheckboxState extends State {

  Map<String, bool> List = {
    'Egges' : false,
    'Chocolates' : false,
    'Flour' : false,
    'Fllower' : false,
    'Fruits' : false,
  };

  var holder_1 = [];

  getItems(){
    List.forEach((key, value) {
      if(value == true)
      {
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
    return Row (children: <Widget>[

      ElevatedButton(
        child: Text(" Get Checked Checkbox Values "),
        onPressed: getItems,
      ),

      Flexible(
        child :
        ListView(
          shrinkWrap: true,
          children: List.keys.map((String key) {
            return CheckboxListTile(
              title: Text(key),
              value: List[key],
              activeColor: Colors.deepPurple[400],
              checkColor: Colors.white,
              onChanged: (bool? value) {
                setState(() {
                  List[key] = value as bool;
                });
              },
            );
          }).toList(),
        ),
      ),]);
  }
}