import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:flutter/material.dart';

/// typedef for the function that is invoked when the user taps on the [ProfileTile]
typedef TapFunction = void Function()?;

/// The custom [ListTile] that is used in the profile screen
class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {key, required this.icon, required this.text, this.trailing, this.onTap})
      : super(key: key);

  final Widget icon;
  final String text;
  final Widget? trailing;
  final TapFunction onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        horizontalTitleGap: AppDoubles.profileTileHorizontalTitleGap,
        contentPadding: EdgeInsets.zero,
        leading: icon,
        title: Text(
          text,
          style: const TextStyle(
            color: AppColors.grey,
            fontWeight: AppFontWeights.profileTileWeight,
            fontSize: AppDoubles.normalFontSize,
          ),
        ),
        trailing: trailing ??
            const Icon(
              AppIcons.goIcon,
              size: AppDoubles.goButtonSize,
            ),
      ),
    );
  }
}
