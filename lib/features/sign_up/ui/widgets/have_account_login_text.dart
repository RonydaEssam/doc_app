import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/theming/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAccountLoginText extends StatelessWidget {
  const HaveAccountLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Have an acoount already? ',
            style: TextStyles.font13BlackRegular,
          ),
          TextSpan(
            text: 'Login',
            style: TextStyles.font13BlueRegular,
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.of(
                context,
              ).pushReplacementNamed(Routes.loginScreen),
          ),
        ],
      ),
    );
  }
}
