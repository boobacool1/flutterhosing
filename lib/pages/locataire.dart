import 'package:flutter/material.dart';

class Locataire extends StatefulWidget {
  @override
  _LocataireState createState() => _LocataireState();
}

class _LocataireState extends State<Locataire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOCATAIRE',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text('LOCATAIRE'),
      ),
    );
  }
}
