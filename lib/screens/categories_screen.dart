import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //إذا كان عدد الصفحة محدد وفي المستقبل لن يتم التحديث نستخدم GridView
    //أما إذا كان محتوى الصفحة سيتم التحديث عليه فنستخدم GridView.builder()
    return GridView(
      padding: EdgeInsets.all(5),
      //gridDelegate:وتعتبر هيكل الGridView
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
      ),
      children: Categories_data.map((categoryDa) => CategoryItem(
          categoryDa.id, categoryDa.title, categoryDa.imageUrl)).toList(),
    );
  }
}
