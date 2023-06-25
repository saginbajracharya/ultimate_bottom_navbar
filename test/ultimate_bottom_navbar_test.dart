import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ultimate_bottom_navbar/ultimate_bottom_navbar.dart';

void main() {
  test('run bottom nav widget', () {
    const UltimateBottomNavBar(icons: [Icons.favorite_outline,Icons.home,Icons.list], titles: ['Like','Home','List'], currentIndex: 0,);
  });
}
