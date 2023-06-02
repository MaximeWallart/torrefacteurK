import 'package:firebase_database/firebase_database.dart';

import '../API/Champ.dart';
import '../API/Joueur.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference dbRefJoueur = database.ref().child("Joueur");

void addJoueur(Joueur joueur) {
  var test = dbRefJoueur.push();
  var id = test.key;
  joueur.id = id!;
  test.set(joueur.toJson());
}

void updateJoueur(Joueur joueur) {
  dbRefJoueur.child(joueur.getId).update(joueur.toJson());
}

class JoueurData {
  late DatabaseReference dbRef;
  void initJoueurData(Joueur joueur) {
    dbRef = dbRefJoueur.child(joueur.id);
  }

  void addChamp(Champ champ) {
    dbRef.child("exploitation").child("champs").set(champ);
  }
}
