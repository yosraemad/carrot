import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:carrot_app/views/signup_page/signup_page.dart';
import 'package:flutter/material.dart';

// * Button that Navigates to the sign up screen
class SignUpButton extends StatelessWidget {
  const SignUpButton({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDoubles.goToSignUpTopPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppStrings.dontHaveAccountText,
            style: TextStyle(fontSize: AppDoubles.goToSignUpFontSize),
          ),
          const SizedBox(
            width: AppDoubles.dontHaveAccountBreakWidth,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, SignUpPage.routeName);
            },
            child: Text(
              AppStrings.createAccountText,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: AppDoubles.goToSignUpFontSize,
                fontWeight: AppFontWeights.createAccountFontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
