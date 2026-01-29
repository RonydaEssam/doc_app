import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theming/text_styles.dart';
import 'package:doc_app/core/widgets/app_text_button.dart';
import 'package:doc_app/features/sign_up/data/models/signup_request_body.dart';
import 'package:doc_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:doc_app/features/sign_up/ui/widgets/form_fields.dart';
import 'package:doc_app/features/sign_up/ui/widgets/have_account_login_text.dart';
import 'package:doc_app/features/sign_up/ui/widgets/signup_bloc_listener.dart';
import 'package:doc_app/features/sign_up/ui/widgets/signup_terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void validateThenSignup(BuildContext context) {
      if (context.read<SignupCubit>().formKey.currentState!.validate()) {
        context.read<SignupCubit>().emitSignupStates;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create Account',
                    style: TextStyles.font24BlueBold,
                    textAlign: TextAlign.start,
                  ),
                ),
                verticalSpacing(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font15GreyRegular,
                  textAlign: TextAlign.start,
                ),
                verticalSpacing(36),
                const FormFields(),
                verticalSpacing(38),
                AppTextButton(
                  buttonText: 'Create Account',
                  onPressed: () {
                    validateThenSignup(context);
                  },
                ),
                verticalSpacing(16),
                const SignupTermsAndConditionsText(),
                verticalSpacing(48),
                const HaveAccountLoginText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
