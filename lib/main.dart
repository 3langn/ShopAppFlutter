import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/main_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/user_product/edit_product_screen.dart';
import 'package:shop_app/screens/user_product/user_product_screen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products(),
          update: (context, auth, preProducts) =>
              Products()..update(auth.token, preProducts!.items),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            appBarTheme: AppBarTheme.of(context).copyWith(
              color: Colors.white,
              iconTheme: IconTheme.of(context).copyWith(
                color: Colors.black,
              ),
            ),
            accentColor: Colors.redAccent,
            fontFamily: 'Lato',
            textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 25,
              ),
              headline5: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          home: auth.isAuth ? MainScreen() : AuthScreen(),
          routes: {
            MainScreen.nameRoute: (ctx) => MainScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrderScreen.routeName: (ctx) => OrderScreen(),
            UserProductScreen.routeName: (ctx) => UserProductScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
