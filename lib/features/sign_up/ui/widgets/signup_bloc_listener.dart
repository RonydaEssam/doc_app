import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/theming/colors.dart';
import 'package:doc_app/core/theming/text_styles.dart';
import 'package:doc_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:doc_app/features/sign_up/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    void showSuccessDialog(BuildContext context) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Congratulations!\nYou Have Signed Up Successfully.',
                  textAlign: TextAlign.center,
                  style: TextStyles.font14DarkGreyMedium,
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
                },
                child: Text(
                  'Continue',
                  style: TextStyles.font16BlueSemiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void setupErrorState(BuildContext context, String error) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.error,
            color: ColorsManager.red,
            size: 32,
          ),
          content: Text(error, style: TextStyles.font14DarkGreyMedium),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Got it!',
                  style: TextStyles.font16BlueSemiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            ),
          ),
          success: (data) {
            showSuccessDialog(context);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
