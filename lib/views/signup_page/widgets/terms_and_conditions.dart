import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/resources/app_text_aligns.dart';
import 'package:flutter/material.dart';

// * Terms and Conditions Text
class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDoubles.termsAndConditionsHorizontalPadding,
          vertical: AppDoubles.termsAndConditionsVerticalPadding),
      child: RichText(
          textAlign: AppTextAligns.termsAndConditionsTextAlign,
          text: TextSpan(
            children: [
              const TextSpan(
                text: AppStrings.termsAndConditionsStringOne,
                style:
                    TextStyle(color: AppColors.termsAndConditionsNormalColor),
              ),
              TextSpan(
                text: AppStrings.termsAndConditionsStringTwo,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              const TextSpan(
                text: AppStrings.termsAndConditionsStringThree,
                style:
                    TextStyle(color: AppColors.termsAndConditionsNormalColor),
              ),
              TextSpan(
                text: AppStrings.termsAndConditionsStringFour,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ],
          )),
    );
  }
}
