import 'package:flutter/material.dart';

class Batiment extends StatefulWidget {
  @override
  _BatimentState createState() => _BatimentState();
}

class _BatimentState extends State<Batiment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BATIMENT',
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
