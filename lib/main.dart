import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kirana_store/screens/categories/categories.dart';
import 'package:provider/provider.dart';
import 'package:kirana_store/common/theme.dart';
import 'package:kirana_store/data/models/cart.dart';
import 'package:kirana_store/data/models/catalog.dart';
import 'package:kirana_store/screens/cart/cart.dart';
import 'package:kirana_store/screens/catalog/catalog.dart';

void main() {
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //    statusBarColor: Colors.grey[200], // status bar color
  //  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        color: Colors.white,
        initialRoute: '/',
        routes: {
          '/': (context) => Categories(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}