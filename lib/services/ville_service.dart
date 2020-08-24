import 'dart:convert';

import 'package:http/http.dart';
import 'package:real_estate_agency/modeles/t_ville.dart';

class Villeservice {
  final String apiUrl = "http://app.groupe-ita.com:8080/logement/api/v1";

  Future<List<TVille>> getVilles() async {
    Response res = await get('$apiUrl/villes');

    if (res.statusCode == 200) {
      String source = Utf8Decoder().convert(res.bodyBytes);
      List<dynamic> body = jsonDecode(source);

      List<TVille> villes =
          body.map((dynamic item) => TVille.fromJson(item)).toList();
      return villes;
    } else {
      throw "Erreur de chargement de la liste";
    }
  }

  Future<List<TVille>> getVilles1() async {
    final response = await get("$apiUrl/villes");
    if (response.statusCode == 200) {
      return villeFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<TVille> getVilleById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      return TVille.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur de chargement');
    }
  }

  Future<TVille> createVille(TVille ville) async {
    Map data = {'lib': ville.lib};

    final Response response = await post(
      '$apiUrl/villes',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return TVille.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur d\'insertion ');
    }
  }

  Future<TVille> updateVilles(String id, TVille ville) async {
    Map data = {'lib': ville.lib};

    final Response response = await put(
      '$apiUrl/villes/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return TVille.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur de mise à jour');
    }
  }

  Future<bool> deleteVille(String id) async {
    final response = await delete(
      "$apiUrl/villes/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
