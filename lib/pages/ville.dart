import 'package:flutter/material.dart';

class Ville extends StatefulWidget {
  @override
  _VilleState createState() => _VilleState();
}

class _VilleState extends State<Ville> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VILLE',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text('VILLE'),
      ),
    );
  }
}
