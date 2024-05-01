import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/shimmer/shimmer_sliders_list_view.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/widgets/custom_error_widget.dart';
import 'package:my_coupon/core/widgets/custom_network_image.dart';
import 'package:my_coupon/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/sliders_cubit/sliders_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/custom_indicator_widget.dart';

class SlidersListView extends StatelessWidget {
  const SlidersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidersCubit, SlidersState>(
      builder: (context, state) {
        if (state is SlidersSuccessState || state is ChangeSliderIndexState) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: SlidersCubit.get(context).sliders.length,
                itemBuilder: (context, index, s) => InkWell(
                  onTap: () {},
                  child: CustomNetworkImage(
                    image: SlidersCubit.get(context).sliders[index].imageUlr,
                    backgroundColor: AppColors.grey50,
                    borderRadius: AppConstants.radius10r,
                  ),
                ),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    SlidersCubit.get(context).changeSliderIndex(index: index);
                  },
                  autoPlay: true,
                  aspectRatio: 2.2,
                  viewportFraction: 0.80,
                  autoPlayInterval: const Duration(seconds: 4),
                  enlargeCenterPage: true,
                ),
              ),
              Gap(AppConstants.size15h),
              CustomIndicatorWidget(
                count: SlidersCubit.get(context).sliders.length,
                currentIndex: SlidersCubit.get(context).currentIndex,
              ),
            ],
          );
        } else if (state is SlidersFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerSlidersListView();
        }
      },
    );
  }
}
