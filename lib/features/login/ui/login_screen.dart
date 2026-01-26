import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theming/text_styles.dart';
import 'package:doc_app/core/widgets/app_text_button.dart';
import 'package:doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/login/data/models/login_request_body.dart';
import 'package:doc_app/features/login/ui/widgets/email_and_password.dart';
import 'package:doc_app/features/login/ui/widgets/have_account_text.dart';
import 'package:doc_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    'Welcome Back',
                    style: TextStyles.font24BlueBold,
                    textAlign: TextAlign.start,
                  ),
                ),
                verticalSpacing(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font15GreyRegular,
                  textAlign: TextAlign.start,
                ),
                verticalSpacing(36),
                const EmailAndPassword(),
                verticalSpacing(16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.font13BlueRegular,
                  ),
                ),
                verticalSpacing(38),
                AppTextButton(
                  buttonText: 'Login',
                  onPressed: () {
                    validateThenLogin(context);
                  },
                ),
                verticalSpacing(16),
                const TermsAndConditionsText(),
                verticalSpacing(48),
                const HaveAccountText(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
