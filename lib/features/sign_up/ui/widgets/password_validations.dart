import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theming/colors.dart';
import 'package:doc_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  Widget buildValidationRules(String text, bool isValidated) {
    return Row(
      children: [
        horizontalSpacing(18),
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: isValidated
              ? ColorsManager.grey50
              : ColorsManager.grey,
        ),
        horizontalSpacing(6),
        Text(
          text,
          style: TextStyles.font14DarkGreyMedium.copyWith(
            decoration: isValidated ? TextDecoration.lineThrough : null,
            decorationColor: ColorsManager.green,
            decorationThickness: 1.w,
            color: isValidated ? ColorsManager.grey50 : ColorsManager.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRules('At least 1 LowerCase character.', hasLowerCase),
        verticalSpacing(2),
        buildValidationRules('At least 1 UpperCase character.', hasUpperCase),
        verticalSpacing(2),
        buildValidationRules(
          'At least 1 Special Character.',
          hasSpecialCharacters,
        ),
        verticalSpacing(2),
        buildValidationRules('At least 1 Number.', hasNumber),
        verticalSpacing(2),
        buildValidationRules('At least 8 characters.', hasMinLength),
      ],
    );
  }
}
