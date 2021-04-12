import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart_screen';
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text('Cart'),
    );
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.92 -
                  MediaQuery.of(context).viewPadding.top -
                  0.5 -
                  appbar.preferredSize.height,
              color: Colors.white,
            ),
            Divider(
              height: 0.5,
              color: Colors.grey,
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.check_box_outline_blank,
                      size: 30,
                    ),
                  ),
                  Text('All'),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total Price:',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '0đ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Receive 0đ',
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: double.infinity,
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Buy (0)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
