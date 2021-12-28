import 'package:flutter/cupertino.dart';
import 'package:product/provider/product_list_provider.dart';
import 'package:product/screen/product_detail/product_detail_screen.dart';
import 'package:product/screen/product_list/product_list_screen.dart';
import 'package:product/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  ProductListScreen.routeName: (context) => ChangeNotifierProvider(
        create: (context) => ProductListProvider(),
        child: const ProductListScreen(),
      ),
  ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
};
