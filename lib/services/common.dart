import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<Map> getJson() async {
  return await jsonDecode(await rootBundle.loadString('assets/owid-covid-data.json'));
}
