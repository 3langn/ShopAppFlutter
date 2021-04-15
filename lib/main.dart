import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(create: (context) => OrderItem())
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          appBarTheme: AppBarTheme.of(context).copyWith(
            color: Colors.white,
          ),
          accentColor: Colors.redAccent,
          fontFamily: 'Lato',
          backgroundColor: Colors.white,
          textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 25,
              ),
              subtitle1: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              )),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
        },
      ),
    );
  }
}
