import 'package:flutter/material.dart';

class AppBarPop extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPop({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.navigate_before,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        title!,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
    return appbar;
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
