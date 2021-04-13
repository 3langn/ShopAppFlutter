import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int quantity;
  final double price;
  final Function changeQuantity;
  CartItem({
    @required this.title,
    @required this.imgUrl,
    @required this.quantity,
    @required this.price,
    @required this.changeQuantity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.check_box_outline_blank_sharp,
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.network(imgUrl),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Row(
                    children: [
                      Text(
                        'đ${price * 1.2}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'đ$price',
                        style: kPriceTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              ContainerBorder(
                height: 40,
                width: 40,
                child: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {},
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(),
                  ),
                ),
                child: Text(
                  quantity.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ContainerBorder(
                width: 40,
                height: 40,
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerBorder extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  ContainerBorder({this.width, this.child, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: child,
    );
  }
}
