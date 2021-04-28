import 'package:flutter/material.dart';
import 'package:shop_app/screens/order_screen.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = 'user_profile_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile'),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(OrderScreen.routeName),
              child: Icon(Icons.shopping_bag),
            )
          ],
        ),
      ),
    );
  }
}
