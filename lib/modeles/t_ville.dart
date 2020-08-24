import 'dart:convert';

class TVille {
  String id;
  String lib;

  TVille({this.id, this.lib});
  //this is static method
  factory TVille.fromJson(Map<String, dynamic> json) {
    return TVille(id: json['id'], lib: json['lib']);
  }

  Map<String, dynamic> toJson() => {"id": id, "lib": lib};

  @override
  String toString() {
    return 'Ville{id: $id, lib: $lib}';
  }
}

List<TVille> villeFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<TVille>.from(str.map((item) => TVille.fromJson(item)));
}

String villeToJson(TVille data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
