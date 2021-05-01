import 'package:flutter/material.dart';
import 'package:shop_app/widgets/search.dart';

class DataSearch extends CustomSearchDelegate {
  DataSearch({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );
  final cities = [
    'Bhanup',
    'Mumbai',
    'Visakhapatnam',
    'Coimbatore',
    'Delhi',
    'Bânglore',
    'Pune',
    'Nagpur',
    'Lucknow',
    'Vandodara',
    'Indore',
    'Jalalpur',
    'New Delhi',
    'Minh Nguyen',
    'Nhu Quynh',
    'Minh Trường',
    'Minh Nhựt',
  ];
  final recentCities = [
    'New Delhi',
    'Minh Nguyen',
    'Nhu Quynh',
    'Minh Trường',
    'Minh Nhựt',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(
      width: 30,
      child: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, '');
        },
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.location_city),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}
