import 'package:flutter/material.dart';
import 'package:shop_app/services/search_service.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCustomSearch(
          context: context, delegate: DataSearch(hintText: 'Search Product')),
      child: Container(
        height: 40,
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Color(0xFFF2F4F5),
            hintStyle: TextStyle(color: Colors.grey[600]),
            hintText: "Search Product",
          ),
        ),
      ),
    );
  }
}
