import 'package:flutter/material.dart';

class settings extends ChangeNotifier {
  var country = 'USA';
  void setCountry(s) {
    country = s;
    notifyListeners();
  }

  get getCountry => country;

  var fill = false;
  get fillState => fill;
  void toggleFill() {
    fill = !fill;
    notifyListeners();
  }

  var dataChoice = "new_cases_smoothed";
  var dataChoiceExplanation = "New Cases";
  get getDataChoice => dataChoice;
  get getDataChoiceExplanation => dataChoiceExplanation;
  void setDataChoice(v) {
    if (v == "new_cases") {
      dataChoice = v + "_smoothed";
      dataChoiceExplanation = "New Cases";
      notifyListeners();
    }
    if (v == "total_cases") {
      dataChoice = v;
      dataChoiceExplanation = "Total Cases";
      notifyListeners();
    }
    if (v == "new_deaths") {
      dataChoice = v + "_smoothed";
      dataChoiceExplanation = "New Deaths";
      notifyListeners();
    }
    if (v == "total_deaths") {
      dataChoice = v;
      dataChoiceExplanation = "Total Deaths";
      notifyListeners();
    }
  }
}
