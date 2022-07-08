import 'package:diary_baby/screen_allergy/screen_allergy.dart';
import 'package:diary_baby/main_screen/screen_photo.dart';
import 'package:flutter/material.dart';

import 'authorization/authorization.dart';
import 'main_screen/main_screen_widget.dart';
import 'main_screen/screen_achievements.dart';
import 'main_screen/background_widget.dart';
import 'main_screen/screen_doctors.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'ScreenHeightWeight/screen_height_weight.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Authorization(),
        '/main_screen': (context) => const BackgroundWidget(
              child: MainScreenWidget(),
            ),
        '/screen_achievements': (context) => const ScreenAchievements(),
        '/screen_doctors': (context) => const BackgroundWidget(
              child: ScreenDoctors(),
            ),
        '/screen_photo': (context) => const ScreenPhoto(),
        '/screen_allergy': (context) => const ScreenAllergy(),
        '/screen_height_weight': (context) => const ScreenHeightWeight(),
      },
      initialRoute: '/',
    );
  }
}
