import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/user_product/product_search_screen.dart';

import 'providers/auth.dart';
import 'providers/cart.dart';
import 'providers/orders.dart';
import 'providers/products.dart';
import 'screens/auth_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/main_screen.dart';
import 'screens/order_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/user_product/edit_product_screen.dart';
import 'screens/user_product/user_product_screen.dart';

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
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (context) => Orders(),
          update: (context, auth, preOrder) => Orders()
            ..update(auth.token, auth.userId,
                preOrder?.order == null ? [] : preOrder!.order),
        ),
      ],
      child: Consumer<Auth>(builder: (context, auth, _) {
        return MaterialApp(
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
          home: auth.isAuth
              ? MainScreen()
              : FutureBuilder(
                  builder: (context, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                  future: auth.tryAutoLogin(),
                ),
          routes: {
            MainScreen.nameRoute: (ctx) => MainScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrderScreen.routeName: (ctx) => OrderScreen(),
            UserProductScreen.routeName: (ctx) => UserProductScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            ProductSearchScreen.routeName: (ctx) => ProductSearchScreen(),
          },
        );
      }),
    );
  }
}
