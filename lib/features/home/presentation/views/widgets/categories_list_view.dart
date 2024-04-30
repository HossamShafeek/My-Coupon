import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/config/routes/app_routes.dart';
import 'package:my_coupon/core/shimmer/shimmer_categories_list_view.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_error_widget.dart';
import 'package:my_coupon/core/widgets/title_list_and_view_all.dart';
import 'package:my_coupon/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/categories_list_view_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return Column(
            children: [
              TitleListAndViewAll(
                title: AppStrings.categories,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.categoriesView,
                    arguments: state.categories,
                  );
                },
              ),
              SizedBox(
                height: 56.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoriesListViewItem(
                      category: state.categories[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Gap(AppConstants.size10w);
                  },
                  itemCount: state.categories.length,
                ),
              ),
            ],
          );
        } else if (state is CategoriesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerCategoriesListView();
        }
      },
    );
  }
}
