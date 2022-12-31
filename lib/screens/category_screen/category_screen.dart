import 'package:flutter/material.dart';
import 'package:movies_app/models/categoryResponse.dart';
import 'package:movies_app/screens/category_screen/category_data.dart';


class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60,bottom: 10),
            child: Text(
              'Browse Category',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(child: CategoryData())
      ],
      ),
    );
  }
}
