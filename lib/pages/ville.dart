import 'package:flutter/material.dart';
import 'package:real_estate_agency/ui/ville/ville_add.dart';
import 'package:real_estate_agency/ui/ville/ville_display.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Ville extends StatefulWidget {
  @override
  _VilleState createState() => _VilleState();
}

class _VilleState extends State<Ville> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text(
          "VILLES",
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
                  return VilleAdd();
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
      body: VilleDisplay(),
    );
  }
}
