import 'package:flutter/material.dart';
import 'package:tracker/views/body.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('COVID-19 Tracker'),
        backgroundColor: Colors.transparent,
      ),
      body: Body(),
    );
  }
}
