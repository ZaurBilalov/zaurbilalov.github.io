import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tracker/services/common.dart';
import 'package:tracker/services/settings.dart';
import 'package:tracker/views/index.dart';
import 'dart:html';
import 'package:provider/provider.dart';

var JSON;
List<dynamic> data;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  JSON = await getJson();
  querySelector(".lds-grid").remove();
  runApp(ChangeNotifierProvider(create: (context) => settings(), child: Index()));
}
