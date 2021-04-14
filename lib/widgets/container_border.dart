import 'package:flutter/material.dart';

class ContainerBorder extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  ContainerBorder({this.width, this.child, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]!, width: 0.5),
      ),
      child: child,
    );
  }
}
