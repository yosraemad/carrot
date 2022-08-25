import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:flutter/material.dart';

/// App bar that appears at the top of the [ItemPage]
class ItemPageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const ItemPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      elevation: AppDoubles.itemPageAppBarElevation,
      leading: IconButton(
        splashColor: AppColors.noSplashIconButtonColor,
        highlightColor: AppColors.noSplashIconButtonColor,
        icon: const Icon(
          AppIcons.backIcon,
          size: AppDoubles.backButtonSize,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: const Text(AppStrings.productDescription),
      actions: const [
        Padding(
          padding:
              EdgeInsets.only(right: AppDoubles.addToFavoritesRightPadding),
          child: Icon(
            AppIcons.addToFavorites,
            size: AppDoubles.addToFavoritesButtonSize,
          ),
        )
      ],
    );
  }
}
