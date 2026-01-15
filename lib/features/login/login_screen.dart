import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theming/colors.dart';
import 'package:doc_app/core/theming/text_styles.dart';
import 'package:doc_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                  textAlign: TextAlign.start,
                ),
                verticalSpacing(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GreyRegular,
                  textAlign: TextAlign.start,
                ),
                verticalSpacing(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpacing(16),
                      AppTextFormField(
                        hintText: 'Password',
                        isObsecureText: isObsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsecureText = !isObsecureText;
                            });
                          },
                          child: Icon(
                            isObsecureText == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 18,
                            color: ColorsManager.darkGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
