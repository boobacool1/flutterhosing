import 'package:flutter/material.dart';

class Logement extends StatefulWidget {
  @override
  _LogementState createState() => _LogementState();
}

class _LogementState extends State<Logement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOGEMENT',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
