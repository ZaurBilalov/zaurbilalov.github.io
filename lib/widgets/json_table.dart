import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:provider/provider.dart';
import 'package:tracker/main.dart';
import 'package:tracker/services/alpha3.dart';
import 'package:tracker/services/settings.dart';

class JsonTableWidget extends StatefulWidget {
  @override
  _JsonTableWidgetState createState() => _JsonTableWidgetState();
}

class _JsonTableWidgetState extends State<JsonTableWidget> {
  @override
  Widget build(BuildContext context) {
    var data = (JSON['${Provider.of<settings>(context, listen: false).getCountry}']['data'] as List);
    var new_cases = new List<Map<dynamic, dynamic>>();
    var dataChoice = Provider.of<settings>(context, listen: false).getDataChoice;
    var dataChoiceExplanation = Provider.of<settings>(context, listen: false).getDataChoiceExplanation;
    data.forEach((element) {
      new_cases.add({'new': element[dataChoice], 'date': element['date']});
    });

    var countryName;
    alpha3.forEach((element) {
      if (element['alpha-3'] == Provider.of<settings>(context, listen: false).country) countryName = element['name'];
    });

    return Center(
      child: LineChart(
        LineChartData(
          axisTitleData: FlAxisTitleData(
            topTitle: AxisTitle(showTitle: true, titleText: "$countryName - $dataChoiceExplanation"),
            bottomTitle: AxisTitle(showTitle: true, titleText: "Date (MM-DD)", margin: 10),
            rightTitle: AxisTitle(showTitle: true, titleText: "Number of $dataChoiceExplanation"),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 0.1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 0.1,
              );
            },
          ),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              rotateAngle: 90,
              showTitles: true,
              getTitles: (value) => value % 2 == 0 ? new_cases[value.toInt()]['date'].toString().substring(5) : "",
              margin: 5,
            ),
            leftTitles: SideTitles(
              showTitles: true,
              //getTitles: (value) => value % 2 == 0 ? new_cases[value.toInt()]['new'].toString() : "",
              interval: (new_cases.last['new'] / 10).floor().toDouble(),
              margin: 5,
            ),
            show: true,
          ),
          lineBarsData: [
            LineChartBarData(
              colors: [Colors.red, Colors.red[900]],
              barWidth: 2,
              belowBarData: BarAreaData(colors: [Colors.red, Colors.red[900]], show: Provider.of<settings>(context, listen: false).fill == true ? true : false),
              dotData: FlDotData(
                checkToShowDot: (spot, barData) => false,
              ),
              spots: List<FlSpot>.generate(
                new_cases.length,
                (index) {
                  return FlSpot(index.toDouble(), new_cases[index]['new']);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
