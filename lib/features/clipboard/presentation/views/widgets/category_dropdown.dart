import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_dropdown.dart';
import 'package:my_coupon/core/widgets/custom_error_widget.dart';
import 'package:my_coupon/core/widgets/loading_indicator_widget.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/categories_cubit/categories_state.dart';

class CategoriesDropdown extends StatelessWidget {
  const CategoriesDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return CustomDropdown(
            title: AppStrings.categoryName,
            hintText: AppStrings.selectCategoryName,
            messageForValidate: AppStrings.pleaseSelectCategoryName,
            items: state.categories
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChange: (value) {
              ClipboardCubit.get(context).categoryDropdownValue = value.name;
            },
          );
        } else if (state is CategoriesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
