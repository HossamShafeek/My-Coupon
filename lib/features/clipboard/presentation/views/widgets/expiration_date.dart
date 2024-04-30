import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_text_field.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_cubit.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_state.dart';

class ExpirationDate extends StatelessWidget {
  const ExpirationDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClipboardCubit, ClipboardState>(
      builder: (context, state) {
        return CustomTextField(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 5),
            ).then(
                  (value) {
                if (value != null) {
                  ClipboardCubit.get(context).expirationDateController.text =
                      DateFormat.yMMMd().format(value);
                }else{
                }
              },
            );
          },
          readOnly: true,
          controller: ClipboardCubit.get(context).expirationDateController,
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.pleaseEnterExpirationDate;
            }
            return null;
          },
          title: AppStrings.expirationDate,
          hintText: AppStrings.enterExpirationDate,
        );
      },
    );
  }
}