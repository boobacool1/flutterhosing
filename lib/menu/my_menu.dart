import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  final String titre;
  final IconData icon;
  final MaterialColor couleur;
  final Object action;

  MyMenu({this.titre, this.icon, this.couleur, this.action});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => action));
        },
        splashColor: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: couleur, size: 70.0),
              Text(
                titre,
                style: TextStyle(fontSize: 17.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
