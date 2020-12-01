import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/services/settings.dart';
import 'package:tracker/widgets/country_data.dart';
import 'package:tracker/widgets/ctrl.dart';
import 'package:tracker/widgets/dropdown.dart';
import 'package:tracker/widgets/json_table.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<settings>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
        )),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CTRL(),
              JsonTableWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
