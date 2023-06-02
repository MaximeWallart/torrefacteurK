import 'dart:math';

import 'package:flutter/material.dart';

import 'Plan.dart';

class   Champ {
  late int specificite;
  List<Plan?> plans = [null, null, null, null];
  late Color background;

  Color randomColor() {
    Color result = Color((Random().nextDouble() * 0xFFFFFF)
            .clamp(0x000000, 0xCCCCCC)
            .toInt())
        .withOpacity(1.0);
    if (result.computeLuminance() < 0 || result == const Color(0xFFCCCCCC)) {
      return randomColor();
    } else {
      return result;
    }
  }

  Champ() {
    background = randomColor();
    specificite = generateSpecificite();
  }

  Map<String, dynamic> toJson() {
    return {
      "specificite": specificite,
      "plans": plans.map((e) => e == null ? "null" : e.toJson()).toList()
    };
  }

  int generateSpecificite() {
    var rdm = Random().nextDouble();
    if (rdm < 0.1) {
      return 1;
    } else if (0.1 <= rdm && rdm < 0.2) {
      return 2;
    } else {
      return 3;
    }
  }

  get getSpecificite => specificite;

  get getPlans => plans;

  set addPlans(Plan plan) => plans.add(plan);

  @override
  String toString() {
    return "$specificite";
  }
}
