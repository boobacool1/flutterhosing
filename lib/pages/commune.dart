import 'package:flutter/material.dart';

class Commune extends StatefulWidget {
  @override
  _CommuneState createState() => _CommuneState();
}

class _CommuneState extends State<Commune> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COMMUNE',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text('COMMUNE'),
      ),
    );
  }
}
