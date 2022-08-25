import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/views/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: AppDoubles.backHomeButtonBottomPadding),
      child: TextButton(
        child: const Text(
          AppStrings.goHomeText,
          style: TextStyle(color: AppColors.defaultColor),
        ),
        onPressed: () {
          /// Navigate to the home page
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.routeName, (route) => false);
        },
      ),
    );
  }
}
