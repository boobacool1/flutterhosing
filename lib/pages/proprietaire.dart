import 'package:flutter/material.dart';

class Proprietaire extends StatefulWidget {
  @override
  _ProprietaireState createState() => _ProprietaireState();
}

class _ProprietaireState extends State<Proprietaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROPRIETAIRE',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text('PROPRIETAIRE'),
      ),
    );
  }
}
