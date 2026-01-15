import 'package:doc_app/core/theming/text_styles.dart';
import 'package:doc_app/features/onboarding/widgets/doc_image_and_main_text.dart';
import 'package:doc_app/features/onboarding/widgets/get_started_button.dart';
import 'package:doc_app/features/onboarding/widgets/logo_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                const LogoAndName(),
                SizedBox(height: 25.h),
                const DocImageAndMainText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font12GreyRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25.h),
                      const GetStartedButton(),
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
