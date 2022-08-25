import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_images.dart';
import 'package:carrot_app/resources/app_offsets.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:flutter/material.dart';

/// App bar that appears at the top of the [HomePage]
class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: AppDoubles.homeTitleLeftSpacing,
      shadowColor: AppColors.homeAppBarShadowColor,
      backgroundColor: AppColors.appBarColor,
      elevation: AppDoubles.itemPageAppBarElevation,
      title: Padding(
        padding: const EdgeInsets.only(left: AppDoubles.homeTitleLeftPadding),
        child: Row(
          children: [
            Container(
              width: 32,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.defaultColor.withOpacity(0.1),
                  spreadRadius: AppDoubles.noSpread,
                  blurRadius: AppDoubles.homeAppBarBlurRadius,
                  offset: AppOffsets.homeAppBarBoxShadowOffset,
                )
              ]),
              child: Image.asset(
                AppImages.logo,
              ),
            ),
            const SizedBox(width: AppDoubles.homeAppBarTitleGap),
            const Text(
              AppStrings.materialAppString,
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: AppColors.grey),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              right: AppDoubles.homeAppBarActionsRightPadding),
          child: TextButton.icon(
            icon: const Icon(Icons.place, color: AppColors.grey),
            onPressed: () {},
            label: const Text(
              AppStrings.homeText,
              style: TextStyle(
                  color: AppColors.grey, fontSize: AppDoubles.normalFontSize),
            ),
          ),
        )
      ],
    );
  }
}
