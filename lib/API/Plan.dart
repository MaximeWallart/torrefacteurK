import 'dart:async';

import 'Kafe.dart';

class Plan {
  late Timer duree;
  late Kafe kafe;

  Plan(this.kafe) {
    duree = Timer(Duration(minutes: kafe.duree), (() {}));
    duree;
  }

  Map<String, String> toJson() {
    return {"kafe": kafe.nom};
  }

  @override
  String toString() {
    return "Timer : ${duree.isActive} | Kafé : $kafe";
  }
}
