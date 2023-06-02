import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color darken({factor = 1.1}) {
    return withBlue((blue / factor).clamp(0, 255).toInt())
        .withGreen((green / factor).clamp(0, 255).toInt())
        .withRed((red / factor).clamp(0, 255).toInt());
  }

  Color lighten({factor = 1.2}) {
    return withBlue((blue * factor).clamp(0, 255).toInt())
        .withGreen((green * factor).clamp(0, 255).toInt())
        .withRed((red * factor).clamp(0, 255).toInt());
  }
}
