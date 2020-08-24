import 'package:flutter/material.dart';
import 'package:real_estate_agency/ui/commune/commune_add.dart';
import 'package:real_estate_agency/ui/commune/commune_display.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Commune extends StatefulWidget {
  @override
  _CommuneState createState() => _CommuneState();
}

class _CommuneState extends State<Commune> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text(
          "COMMUNE",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () async {
              var result = await Navigator.push(
                _scaffoldState.currentContext,
                MaterialPageRoute(builder: (BuildContext context) {
                  return CommuneAdd();
                }),
              );
              if (result != null) {
                setState(() {});
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: CommuneDisplay(),
    );
  }
}
