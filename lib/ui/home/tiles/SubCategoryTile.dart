import 'package:flutter/material.dart';

import '../../../data/models/Category.dart';

class SubCategoryTile extends StatelessWidget {
  final SubCategory subCategory;
  const SubCategoryTile({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.access_time_outlined),
        title: Text(subCategory.title),
    );
  }
}
