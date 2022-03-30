import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamapt/modules/home/views/product_details_page.dart';
import 'package:teamapt/ui/widgets/router.dart';

import 'modules/home/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //setup service locators
//  setupLocator();
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide keyboard on Tap Out
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          currentFocus.requestFocus(FocusNode());
        }
      },
      child: MaterialApp(
          title: 'TeamApt',
          initialRoute: SplashScreen.routeName,
          routes: AppRouter.routes),
    );
  }
}
