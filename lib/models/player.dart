import 'dart:convert';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tftt/api.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;

Player playerFromJson(String str) => Player.fromJson(json.decode(str));

String playerToJson(Player data) => json.encode(data.toJson());

Future<Player> fetchPlayer(numLic) async {
  final response =
      await http.get(Uri.parse("${Api.apiBaseUrl}/players/$numLic"));
  if (response.statusCode == 200) {
    Player player = await playerFromJson(response.body);
    return player;
  } else {
    throw Exception(
        'Impossible de charger le joueur, vérifier votre connexion Internet');
  }
}

class Player {
  Player({
    this.numClub,
    this.points,
    this.prenom,
    this.nom,
  });

  String numClub;
  String points;
  String prenom;
  String nom;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        numClub: json["nclub"],
        points: json["points"],
        prenom: json["prenom"],
        nom: json["nom"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
        "nclub": numClub,
        "prenom": prenom,
        "nom": nom,
      };
}

Future<void> initPlayer() async {
  await fetchPlayer(Settings.getValue<String>('numLicence', '3524012'))
      .then((result) {
    globals.player = result;
  });
}
