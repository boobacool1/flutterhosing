import 'package:flutter/material.dart';
import 'package:real_estate_agency/modeles/t_ville.dart';
import 'package:real_estate_agency/services/ville_service.dart';
import 'package:real_estate_agency/ui/ville/ville_add.dart';

class VilleDisplay extends StatefulWidget {
  @override
  _VilleDisplayState createState() => _VilleDisplayState();
}

class _VilleDisplayState extends State<VilleDisplay> {
  Villeservice villeService;
  @override
  void initState() {
    super.initState();
    villeService = Villeservice();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: villeService.getVilles(),
        builder: (BuildContext context, AsyncSnapshot<List<TVille>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Un problème avec le message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<TVille> villes = snapshot.data;
            return _buildListView(villes);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<TVille> villes) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          TVille ville = villes[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ville.lib,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            var result = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VilleAdd(ville: ville);
                            }));
                            if (result != null) {
                              setState(() {});
                            }
                          },
                          child: Text(
                            "Communes",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Avertissment"),
                                    content: Text(
                                        "Voulez-vous vraiment supprimer ${ville.lib}?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Oui"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          villeService
                                              .deleteVille(ville.id)
                                              .then((isSuccess) {
                                            if (isSuccess) {
                                              setState(() {});
                                              Scaffold.of(this.context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Données supprimées")));
                                            } else {
                                              Scaffold.of(this.context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Problème de suppression")));
                                            }
                                          });
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            "Supprimer",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        FlatButton(
                          onPressed: () async {
                            var result = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VilleAdd(ville: ville);
                            }));
                            if (result != null) {
                              setState(() {});
                            }
                          },
                          child: Text(
                            "Modifier",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: villes.length,
      ),
    );
  }
}
