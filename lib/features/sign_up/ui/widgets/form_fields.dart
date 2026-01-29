import 'package:doc_app/core/helpers/app_regex.dart';
import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theming/colors.dart';
import 'package:doc_app/core/widgets/app_text_form_field.dart';
import 'package:doc_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:doc_app/features/sign_up/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormFields extends StatefulWidget {
  const FormFields({super.key});

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  bool isObsecureText = true;

  late TextEditingController passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(
      () {
        setState(() {
          hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
          hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
          hasSpecialCharacters = AppRegex.hasSpecialCharacter(
            passwordController.text,
          );
          hasNumber = AppRegex.hasNumber(passwordController.text);
          hasMinLength = AppRegex.hasMinLength(passwordController.text);
        });
      },
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'User Name',
            controller: context.read<SignupCubit>().userNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name.';
              }
            },
          ),
          verticalSpacing(16),
          AppTextFormField(
            hintText: 'Email',
            controller: context.read<SignupCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email.';
              }
            },
          ),
          verticalSpacing(16),
          AppTextFormField(
            hintText: 'Phone Number',
            controller: context.read<SignupCubit>().phoneNumberController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number.';
              }
            },
          ),
          verticalSpacing(16),
          AppTextFormField(
            hintText: 'Password',
            controller: context.read<SignupCubit>().passwordController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password.';
              }
            },
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
                color: ColorsManager.mainBlue,
              ),
            ),
          ),
          verticalSpacing(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
