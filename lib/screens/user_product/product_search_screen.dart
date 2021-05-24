import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/overview/components/badge.dart';
import 'package:shop_app/screens/overview/components/products_grid.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductSearchScreen extends StatefulWidget {
  static const routeName = 'product_search_screen';
  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  bool _showFav = false;
  var _isInit = true;
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
    final routesArg =
        ModalRoute.of(context)!.settings.arguments as List<Product>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        iconTheme: IconTheme.of(context).copyWith(
          color: Colors.white,
        ),
        title: Text('Shop'),
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
      body: ProductsGrid(_showFav, routesArg),
    );
  }
}
