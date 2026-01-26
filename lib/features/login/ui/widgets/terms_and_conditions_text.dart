import 'package:doc_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font13Grey60Regular,
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyles.font13BlackRegular,
          ),
          TextSpan(
            text: 'and ',
            style: TextStyles.font13Grey60Regular,
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: TextStyles.font13BlackRegular,
          ),
        ],
      ),
    );
  }
}
