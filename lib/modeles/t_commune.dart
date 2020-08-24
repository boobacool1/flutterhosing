import 'dart:convert';
import 'package:real_estate_agency/modeles/t_ville.dart';

class TCommune {
  String id;
  String lib;
  String villeId;
  TVille ville;

  TCommune({this.id, this.lib, this.villeId});

  factory TCommune.fromJson(Map<String, dynamic> json) {
    return TCommune(
        id: json['id'], lib: json['lib'], villeId: json['ville_id']);
  }

  Map<String, dynamic> toJson() => {"id": id, "lib": lib, "ville_id": villeId};

  @override
  String toString() {
    return 'Commune{id: $id, lib: $lib, ville:$ville}';
  }
}

List<TCommune> communeFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<TCommune>.from(str.map((item) => TCommune.fromJson(item)));
}

String communeToJson(TVille data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
