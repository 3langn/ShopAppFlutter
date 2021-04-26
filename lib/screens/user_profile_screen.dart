import 'package:flutter/material.dart';

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
        child: Text('Profile'),
      ),
    );
  }
}
