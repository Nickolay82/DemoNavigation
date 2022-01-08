import 'package:flutter/material.dart';
import 'package:textwidjet/switches_demo_screen.dart';
import 'package:textwidjet/text_demo_screen.dart';

import 'app_bar_screen.dart';
import 'navigation_drawer_screen.dart';

void main() {
        runApp(
            MaterialApp(
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/': (context) => const MainScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/first': (context) => const FirstScreen(),
            '/second': (context) => const SecondScreen(),
          },
        )
  );
  }






