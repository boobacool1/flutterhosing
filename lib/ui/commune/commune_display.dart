import 'package:flutter/material.dart';
import 'package:real_estate_agency/services/ville_service.dart';

class CommuneDisplay extends StatefulWidget {
  @override
  _CommuneDisplayState createState() => _CommuneDisplayState();
}

class _CommuneDisplayState extends State<CommuneDisplay> {
  Villeservice villeService;

  @override
  void initState() {
    super.initState();
    villeService = Villeservice();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
