import 'package:doc_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Doesn\'t have an acoount yet? ',
            style: TextStyles.font13BlackRegular,
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font13BlueRegular,
          ),
        ],
      ),
    );
  }
}
