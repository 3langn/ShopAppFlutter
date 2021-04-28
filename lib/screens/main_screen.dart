import 'package:flutter/material.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/user_product/user_product_screen.dart';
import 'package:shop_app/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  static const nameRoute = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectIndex = 0;
  void _onTapBottomNavigationBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  late List<Map<String, Object>> _pages = [
    {
      'page': ProductsOverviewScreen(),
      'label': 'Overview',
    },
    {
      'page': UserProductScreen(),
      'label': 'User Product',
    },
    {
      'page': UserProfileScreen(),
      'label': 'Profile',
    }
    // {
    //   'page': CartScreen(),
    //   'label': 'Cart',
    // },
  ];
  @override
  void initState() {
    print('Init Main Screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_rounded),
            label: 'My Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectIndex,
        onTap: _onTapBottomNavigationBar,
      ),
      body: _pages[_selectIndex]['page'] as Widget?,
    );
  }
}

// BottomNavigationBarItem(
//     icon: Icon(Icons.wysiwyg_rounded),
//     label: 'Home'
// ),
// BottomNavigationBarItem(
//     icon: Icon(Icons.photo_camera_front),
//     label: 'Home'
// ),
// BottomNavigationBarItem(
//     icon: Icon(Icons.notifications_active),
//     label: 'Home'
// ),
