import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<Post>> fetchPosts() async {
  final response = await http.get(
      Uri.parse('https://thorigne-tt.net/wp-json/wp/v2/posts?_embed'),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    return postFromJson(response.body);
  } else {
    throw Exception(
        'Impossible de charger les posts, vérifier votre connexion Internet');
  }
}

class Post {
  Post(
      {@required this.id,
      @required this.date,
      @required this.link,
      @required this.title,
      @required this.networkImg});

  int id;
  DateTime date;
  String link;
  String title;
  String networkImg;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json["id"],
      date: DateTime.parse(json["date"]),
      link: json["link"],
      title: json["title"]["rendered"],
      networkImg: json["_embedded"]["wp:featuredmedia"][0]["source_url"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "link": link,
        "title": title,
        "networkImg": networkImg
      };
}
