import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/services/settings.dart';
import '../main.dart';
import 'ctrl.dart';

class DropdownRowWidget extends StatefulWidget {
  @override
  _DropdownRowWidgetState createState() => _DropdownRowWidgetState();
}

class _DropdownRowWidgetState extends State<DropdownRowWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: "Enter country ALPHA3 (eg, USA or MNE), then press ENTER"),
      onSubmitted: (value) {
        countryFocusNode.unfocus();
        if (value != "" && JSON[value.toUpperCase()] != null) {
          countryController.clear();
          value.toUpperCase();
          Provider.of<settings>(context, listen: false).setCountry(value.toUpperCase());
        }
      },
      focusNode: countryFocusNode,
      controller: countryController,
    );
  }
}

FocusNode countryFocusNode = new FocusNode(canRequestFocus: true);
TextEditingController countryController = new TextEditingController();
