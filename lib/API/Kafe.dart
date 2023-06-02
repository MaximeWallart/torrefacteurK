// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/animation.dart';

class Kafe {
  String nom;
  Color avatar;
  int duree;
  int cout;
  double poids;
  double gout;
  double amertume;
  double teneur;
  double odorat;

  Kafe(
    this.nom,
    this.avatar,
    this.duree,
    this.cout,
    this.poids,
    this.gout,
    this.amertume,
    this.teneur,
    this.odorat,
  );

  get getNom => nom;

  set setNom(var nom) => this.nom = nom;

  get getAvatar => avatar;

  set setAvatar(avatar) => this.avatar = avatar;

  get getDuree => duree;

  set setDuree(duree) => this.duree = duree;

  get getCout => cout;

  set setCout(cout) => this.cout = cout;

  get getPoids => poids;

  set setPoids(poids) => this.poids = poids;

  get getGout => gout;

  set setGout(gout) => this.gout = gout;

  get getAmertume => amertume;

  set setAmertume(amertume) => this.amertume = amertume;

  get getTeneur => teneur;

  set setTeneur(teneur) => this.teneur = teneur;

  get getOdorat => odorat;

  set setOdorat(odorat) => this.odorat = odorat;
}
