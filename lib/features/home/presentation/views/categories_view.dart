import 'package:flutter/material.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_back_button.dart';
import 'package:my_coupon/features/home/data/models/categories_model/categories_model.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.categories),
        leading: const CustomBackButton(),
      ),
      body: CategoriesViewBody(
        categories: categories,
      ),
    );
  }
}




