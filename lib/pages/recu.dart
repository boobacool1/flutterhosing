import 'package:flutter/material.dart';

class Recu extends StatefulWidget {
  @override
  _RecuState createState() => _RecuState();
}

class _RecuState extends State<Recu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RECU',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text('Reçu'),
      ),
    );
  }
}
