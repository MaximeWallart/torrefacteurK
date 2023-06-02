// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:torrefactor/API/Exploitation.dart';

class Joueur {
  String id;
  String nom;
  String prenom;
  String pseudo;
  String avatar;
  String mail;
  int bourse;
  int bourseGrainOr;
  Exploitation exploitation;

  Joueur(
      {this.id = "",
      required this.nom,
      required this.prenom,
      required this.pseudo,
      required this.avatar,
      required this.mail,
      required this.bourse,
      required this.bourseGrainOr,
      required this.exploitation});

  Map<String, Object> toJson() {
    return {
      "nom": nom,
      "prenom": prenom,
      "pseudo": pseudo,
      "avatar": avatar,
      "mail": mail,
      "bourse": bourse,
      "bourseGrainOr": bourseGrainOr,
      "exploitation": exploitation.toJson()
    };
  }

  get getId => id;

  set setId(id) => this.id = id;

  get getNom => nom;

  set setNom(nom) => this.nom = nom;

  get getPrenom => prenom;

  set setPrenom(prenom) => this.prenom = prenom;

  get getPseudo => pseudo;

  set setPseudo(pseudo) => this.pseudo = pseudo;

  get getAvatar => avatar;

  set setAvatar(avatar) => this.avatar = avatar;

  get getMail => mail;

  set setMail(mail) => this.mail = mail;

  get getBourse => bourse;

  set setBourse(bourse) => this.bourse = bourse;

  get getBourseGrainOr => bourseGrainOr;

  set setBourseGrainOr(bourseGrainOr) => this.bourseGrainOr = bourseGrainOr;

  get getExploitation => exploitation;

  set setExploitation(Exploitation exploitation) =>
      this.exploitation = exploitation;
}
