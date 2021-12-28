import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product/screen/splash/splash_screen.dart';
import 'package:product/utils/constants.dart';
import 'package:product/utils/routes.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: kAppName,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
