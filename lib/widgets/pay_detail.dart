import 'package:flutter/material.dart';

class PayDetail extends StatelessWidget {
  const PayDetail({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                'Total Price:',
                style: TextStyle(fontSize: 15),
              ),
              FittedBox(
                child: Text(
                  '0đ',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
    );
  }
}
