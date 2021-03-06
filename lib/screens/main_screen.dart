import 'package:flutter/material.dart';
import 'package:shop_app/screens/overview/products_overview_screen.dart';
import 'package:shop_app/screens/user_product/user_product_screen.dart';
import 'package:shop_app/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  static const nameRoute = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectIndex;
  final _page = [
    ProductsOverviewScreen(),
    UserProductScreen(),
    UserProfileScreen()
  ];
  late final PageController _pageController;
  void _onTapBottomNavigationBar(int index) {
    setState(() {
      _selectIndex = index;
      _pageController.jumpToPage(_selectIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectIndex = 0;
    _pageController = PageController(initialPage: _selectIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _page,
      ),
    );
  }
}
