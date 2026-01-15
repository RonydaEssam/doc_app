import 'package:doc_app/core/theming/colors.dart';
import 'package:doc_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonWidth,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        backgroundColor: WidgetStatePropertyAll(ColorsManager.mainBlue),
        padding: WidgetStatePropertyAll(
          REdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth?.w ?? double.maxFinite, 52.h),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyles.font16WhiteSemiBold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
