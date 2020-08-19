import 'package:flutter/material.dart';

class Secteur extends StatefulWidget {
  @override
  _SecteurState createState() => _SecteurState();
}

class _SecteurState extends State<Secteur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SECTEUR',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text('SECTEUR'),
      ),
    );
  }
}
