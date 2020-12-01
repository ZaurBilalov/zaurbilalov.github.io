import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/services/settings.dart';

import 'country_data.dart';
import 'dropdown.dart';

class CTRL extends StatefulWidget {
  @override
  _CTRLState createState() => _CTRLState();
}

class _CTRLState extends State<CTRL> {
  var column = "new_cases";
  var _fill = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20),
        width: 500,
        decoration: BoxDecoration(color: Colors.grey[350].withOpacity(0.2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DropdownRowWidget(),
                Row(
                  children: [
                    Text("Fill The Graph: "),
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          _fill = value;
                          Provider.of<settings>(context, listen: false).toggleFill();
                        });
                      },
                      value: _fill,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Select a data column: "),
                    DropdownButton(
                      icon: Icon(Icons.arrow_downward, color: Colors.white),
                      value: column,
                      onChanged: (v) => setState(() {
                        column = v;
                        Provider.of<settings>(context, listen: false).setDataChoice(v);
                      }),
                      items: [
                        DropdownMenuItem(child: Text("New Cases"), value: "new_cases"),
                        DropdownMenuItem(child: Text("Total Cases"), value: "total_cases"),
                        DropdownMenuItem(child: Text("New Deaths"), value: "new_deaths"),
                        DropdownMenuItem(child: Text("Total Deaths"), value: "total_deaths"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            CountryDataWidget(),
          ],
        ),
      ),
    );
  }
}
