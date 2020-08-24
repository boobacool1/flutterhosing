import 'package:flutter/material.dart';
import 'package:real_estate_agency/modeles/t_ville.dart';
import 'package:real_estate_agency/services/ville_service.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class VilleAdd extends StatefulWidget {
  TVille ville;
  VilleAdd({this.ville});
  @override
  _VilleAddState createState() => _VilleAddState();
}

class _VilleAddState extends State<VilleAdd> {
  bool _isLoading = false;
  Villeservice _villeService = Villeservice();
  bool _isFieldLibValid;

  TextEditingController _controllerLib = TextEditingController();

  @override
  void initState() {
    if (widget.ville != null) {
      _isFieldLibValid = true;
      _controllerLib.text = widget.ville.lib;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.ville == null ? "Ajouter Ville" : "Modifier Ville",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldLib(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    child: Text(
                      widget.ville == null
                          ? "Ajouter".toUpperCase()
                          : "Modifier".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_isFieldLibValid == null) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Veuillez remplir tous les champs"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      String lib = _controllerLib.text.toString();
                      TVille ville = TVille(lib: lib);
                      if (widget.ville == null) {
                        _villeService.createVille(ville).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess != null) {
                            Navigator.pop(
                                _scaffoldState.currentState.context, true);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Erreur d'insertion"),
                            ));
                          }
                        });
                      } else {
                        ville.id = widget.ville.id;
                        _villeService
                            .updateVilles(ville.id, ville)
                            .then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess != null) {
                            Navigator.pop(
                                _scaffoldState.currentState.context, true);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Update data failed"),
                            ));
                          }
                        });
                      }
                    },
                    color: Colors.orange[600],
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldLib() {
    return TextField(
      controller: _controllerLib,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Libellé",
        errorText: _isFieldLibValid == null || _isFieldLibValid
            ? null
            : "Libellé est obligatoire",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldLibValid) {
          setState(() => _isFieldLibValid = isFieldValid);
        }
      },
    );
  }
}
