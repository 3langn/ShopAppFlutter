import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/overview/components/badge.dart';
import 'package:shop_app/screens/overview/components/products_grid.dart';
import 'package:shop_app/widgets/search_bar.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = 'products_overview_screen';
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen>
    with AutomaticKeepAliveClientMixin<ProductsOverviewScreen> {
  bool _showFav = false;
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Products>(context, listen: false).fetchAndSetProducts();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) {
              return Badge(
                child: ch,
                value: cart.itemCount.toString(),
              );
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showFav, null),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
