import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tracker/services/settings.dart';

import '../main.dart';

class CountryDataWidget extends StatefulWidget {
  @override
  _CountryDataWidgetState createState() => _CountryDataWidgetState();
}

class _CountryDataWidgetState extends State<CountryDataWidget> {
  @override
  Widget build(BuildContext context) {
    var countryData = JSON[Provider.of<settings>(context, listen: false).country.toString()];
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              "Statistics:",
              style: TextStyle(fontSize: 20),
            ),
            Text("Country: ${Provider.of<settings>(context, listen: false).country.toString()}"),
            Text("Continent: ${countryData['continent']}"),
            Text("Population: ${countryData['population']}"),
            Text("Median Age: ${countryData['median_age']}"),
            Text("GDP per Capita: ${countryData['gdp_per_capita']}"),
            Text("Extreme Poverty: ${countryData['extreme_poverty']}%"),
            Text("Cardiovascular Death Rate: ${countryData['cardiovasc_death_rate']}"),
            Text("Diabetes Prevalence: ${countryData['diabetes_prevalence']}%"),
            Text("Female Smokers: ${countryData['female_smokers']}%"),
            Text("Male Smokers: ${countryData['male_smokers']}%"),
            Text("Hospital Beds Per Thousand: ${countryData['hospital_beds_per_thousand']}"),
            Text("Life Expectancy: ${countryData['life_expectancy']}"),
            Text("Human Development Index: ${countryData['human_development_index']}"),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
