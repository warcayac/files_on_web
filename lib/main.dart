import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:device_preview/device_preview.dart';

import 'config/app.dart';
import 'pages/home/home_page.dart';
import 'shared/constants.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle( // only Android
  // systemNavigationBarColor: Colors.transparent,
  statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
  // runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

/* ============================================================================================= */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  /* ---------------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp(context);
  }
  /* ---------------------------------------------------------------------------- */
  Widget _buildMaterialApp(BuildContext context) {
    var textTheme = WApp.material.googleTextTheme(context);
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: textTheme.copyWith(
          bodyText2: textTheme.bodyText2!.copyWith(fontSize: kFontSize),
          button: textTheme.button!.copyWith(fontSize: kFontSize),
          caption: textTheme.caption!.copyWith(fontSize: kFontSize - 1),
          subtitle1: textTheme.subtitle1!.copyWith(fontSize: kFontSize + 1),
          subtitle2: textTheme.subtitle2!.copyWith(fontSize: kFontSize - 1),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
