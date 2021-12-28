import 'dart:async';

import 'package:flutter/material.dart';
import 'package:product/screen/product_list/product_list_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        ProductListScreen.routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
