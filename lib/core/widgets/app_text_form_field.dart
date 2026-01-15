import 'package:doc_app/core/theming/colors.dart';
import 'package:doc_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isObsecureText,
    this.suffixIcon,
  });

  final String hintText;
  final bool? isObsecureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecureText ?? false,
      style: TextStyles.font14DarkGreyMedium,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        hintText: hintText,
        hintStyle: TextStyles.font14Grey50Medium,
        filled: true,
        fillColor: ColorsManager.formColor,
        suffixIcon: suffixIcon,
        suffixIconColor: ColorsManager.grey50,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.grey30,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.red,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
