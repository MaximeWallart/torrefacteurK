import 'package:flutter/material.dart';
import 'package:torrefactor/API/Kafe.dart';

class Rubisca extends Kafe {
  Rubisca()
      : super("Rubisca", Colors.red, 10, 2, 0.632, 0.15, 0.54, 0.35, 0.19);
}

class Arbrista extends Kafe {
  Arbrista()
      : super("Arbrista", Colors.green, 40, 6, 0.274, 0.87, 0.04, 0.35, 0.59);
}

class Roupetta extends Kafe {
  Roupetta()
      : super("Roupetta", Colors.yellow, 20, 3, 0.461, 0.35, 0.41, 0.75, 0.67);
}

class Tourista extends Kafe {
  Tourista()
      : super("Tourista", Colors.blue, 1, 1, 0.961, 0.03, 0.91, 0.74, 0.06);
}

class Goldoria extends Kafe {
  Goldoria()
      : super("Goldoria", Colors.purple, 30, 2, 0.473, 0.39, 0.09, 0.07, 0.87);
}
