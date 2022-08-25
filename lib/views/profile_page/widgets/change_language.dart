import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:flutter/material.dart';

/// The Leading widget for the "change language" list tile
class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDoubles.langButtonHeight,
      width: AppDoubles.langButtonWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            AppStrings.dummyLanguageText,
            style: TextStyle(
                color: AppColors.grey,
                fontWeight: AppFontWeights.profileTextFontWeight,
                fontSize: AppDoubles.normalFontSize),
          ),
          Icon(
            AppIcons.goIcon,
            size: AppDoubles.goButtonSize,
          ),
        ],
      ),
    );
  }
}
