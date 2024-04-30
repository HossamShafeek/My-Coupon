import 'package:flutter/material.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/features/home/data/models/categories_model/categories_model.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/categories_grid_view_item.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: AppConstants.size15h,
        crossAxisSpacing: AppConstants.size15h,
      ),
      itemBuilder: (context, index) => CategoriesGridViewItem(
        category: categories[index],
      ),
    );
  }
}