import 'package:flutter/material.dart';
import 'package:real_estate_agency/menu/my_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_agency/pages/batiment.dart';
import 'package:real_estate_agency/pages/home.dart';
import 'package:real_estate_agency/pages/infos.dart';
import 'package:real_estate_agency/pages/location.dart';
import 'package:real_estate_agency/pages/logement.dart';
import 'package:real_estate_agency/pages/recu.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SHAMS GROUPE',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.yellowAccent[100],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.yellowAccent[100], Colors.yellow])),
                child: Container(
                  child: Column(
                    children: [
                      Material(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/shams.jpg',
                              width: 80,
                              height: 80,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'SHAMS GROUPE',
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      )
                    ],
                  ),
                )),
            MyMenuList(
              titre: 'Propriétaire',
              icon: Icons.person,
              action: '/propritaire',
            ),
            MyMenuList(
              titre: 'Ville',
              icon: Icons.person,
              action: '/ville',
            ),
            MyMenuList(
              titre: 'Commune',
              icon: Icons.person,
              action: '/commune',
            ),
            MyMenuList(
              titre: 'Secteur',
              icon: Icons.person,
              action: '/secteur',
            ),
            MyMenuList(
              titre: 'locataire',
              icon: Icons.person,
              action: '/propritaire',
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            MyMenu(
                titre: 'ACCUEIL',
                icon: Icons.home,
                couleur: Colors.brown,
                action: Home()),
            MyMenu(
                titre: 'LOCATION',
                icon: FontAwesomeIcons.houzz,
                couleur: Colors.cyan,
                action: Location()),
            MyMenu(
                titre: 'RECU',
                icon: FontAwesomeIcons.moneyCheck,
                couleur: Colors.cyan,
                action: Recu()),
            MyMenu(
                titre: 'INFORMATION',
                icon: FontAwesomeIcons.infoCircle,
                couleur: Colors.cyan,
                action: Information()),
            MyMenu(
                titre: 'BATIMENT',
                icon: FontAwesomeIcons.building,
                couleur: Colors.cyan,
                action: Batiment()),
            MyMenu(
                titre: 'LOGEMENT',
                icon: FontAwesomeIcons.bed,
                couleur: Colors.cyan,
                action: Logement())
          ],
        ),
      ),
    );
  }
}

class MyMenuList extends StatelessWidget {
  final String titre;
  final IconData icon;
  final String action;
  MyMenuList({this.titre, this.icon, this.action});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Icon(icon),
        title: Text(titre),
        onTap: () => {},
      ),
    );
  }
}
