import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;
import 'package:flutter_tftt/utils/utils.dart';
//widgets
import 'package:flutter_tftt/widgets/drawer-header.dart';
import 'package:flutter_tftt/widgets/drawer-tile.dart';

class MaterialDrawer extends StatelessWidget {
  final String currentPage;
  MaterialDrawer({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(children: [
        DrawerHeaderWidget(),
        Expanded(
            child: ListView(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            if (globals.live.isLive)
              DrawerTile(
                  icon: Icons.live_tv,
                  onTap: () async {
                    await Utils.launchLink(!kIsWeb
                        ? 'fb://page/251704445607468'
                        : 'https://www.facebook.com/Equipe-professionnelle-Thorign%C3%A9-Fouillard-TT-251704445607468'); //videos/${globals.live.liveId}/
                  },
                  iconColor: Color.fromARGB(255, 255, 17, 0),
                  title: "Live en cours",
                  isSelected: false),
            DrawerTile(
                icon: Icons.home,
                onTap: () {
                  if (currentPage != "Posts du TFTT")
                    Navigator.pushReplacementNamed(context, '/home');
                },
                iconColor: Colors.black,
                title: "Posts du TFTT",
                isSelected: currentPage == "Posts du TFTT"),
            DrawerTile(
                icon: Icons.account_circle,
                onTap: () {
                  if (currentPage != "Mon Profil")
                    Navigator.pushReplacementNamed(context, '/profile');
                },
                iconColor: Colors.black,
                title: "Mon profil",
                isSelected: currentPage == "Mon Profil"),
            DrawerTile(
                icon: Icons.group,
                onTap: () {
                  if (currentPage != "Les Équipes")
                    Navigator.pushReplacementNamed(context, '/teams');
                },
                iconColor: Colors.black,
                title: "Les Équipes",
                isSelected: currentPage == "Les Équipes"),
            DrawerTile(
                icon: Icons.calendar_today,
                onTap: () {
                  if (currentPage != "Calendrier")
                    Navigator.pushReplacementNamed(context, '/calendar');
                },
                iconColor: Colors.black,
                title: "Calendrier / Rés. de table",
                isSelected: currentPage == "Calendrier"),
            if (globals.player.numClub == "03350060")
              DrawerTile(
                  icon: Icons.calendar_today_outlined,
                  onTap: () {
                    if (currentPage != "Événements TFTT")
                      Navigator.pushReplacementNamed(context, '/events');
                  },
                  iconColor: Colors.black,
                  title: "Événements TFTT",
                  isSelected: currentPage == "Événements TFTT"),
            if (globals.player.numClub == "03350060")
              DrawerTile(
                  icon: Icons.shopping_cart,
                  onTap: () {
                    if (currentPage != "Commande Matériel")
                      Navigator.pushReplacementNamed(context, '/ordering');
                  },
                  iconColor: Colors.black,
                  title: "Commande Matériel",
                  isSelected: currentPage == "Commande Matériel"),
            DrawerTile(
                icon: Icons.shopping_cart,
                onTap: () async {
                  await Utils.launchLink(
                      'https://www.helloasso.com/associations/thorigne-fouillard-tennis-de-table/evenements/pro-a-tftt-rouen-spo-1ere-journee/widget');
                },
                iconColor: Colors.black,
                title: "Billetterie Pro A",
                isSelected: currentPage == "Billetterie Pro A"),
            if (Settings.getValue<String>('profileType', 'joueur') ==
                'entraineur')
              DrawerTile(
                icon: Icons.notification_add,
                onTap: () {
                  //pushNotification('La salle est ouverte par ${globals.player.prenom} ${globals.player.prenom} ce soir')
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Votre notification a bien été envoyée à tous les joueurs du TFTT")));
                },
                iconColor: Colors.black,
                title: "Notif. salle ouverte",
              ),
            DrawerTile(
                icon: Icons.settings,
                onTap: () {
                  if (currentPage != "Paramètres")
                    Navigator.pushReplacementNamed(context, '/settings');
                },
                iconColor: Colors.black,
                title: "Paramètres",
                isSelected: currentPage == "Paramètres"),
          ],
        ))
      ])),
    );
  }
}
