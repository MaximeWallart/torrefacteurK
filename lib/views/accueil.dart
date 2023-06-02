import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:torrefactor/API/Joueur.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key, required this.joueur});

  final Joueur joueur;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "Resources de ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground)),
                  TextSpan(
                      text: joueur.pseudo,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.bold))
                ],
              )),
              randomAvatar(joueur.avatar, height: 50, width: 50),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                "assets/coin.gif",
                height: 50.0,
                width: 50.0,
              ),
              Text("Nombre de DeeVee : ${joueur.bourse}")
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                "assets/coffee2.gif",
                height: 50.0,
                width: 50.0,
              ),
              Text("Nombre de grains de kafé : ${joueur.bourseGrainOr}")
            ],
          ),
        ),
      ],
    );
  }
}
