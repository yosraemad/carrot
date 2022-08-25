import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/views/category_page/category_page.dart';
import 'package:flutter/material.dart';

/// App bar that appears on top of the [CategoryPage]
/// @param args: the arguments of the [CategoryPage]
class CategoryPageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const CategoryPageAppBar({
    Key? key,
    required this.args,
  }) : super(key: key);

  final CategoryPageArgs args;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.transparentAppBarColor,
      elevation: AppDoubles.noElevation,
      leading: IconButton(
        splashColor: AppColors.noSplashIconButtonColor,
        highlightColor: AppColors.noSplashIconButtonColor,
        icon: const Icon(
          AppIcons.backIcon,
          size: AppDoubles.backButtonSize,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        args.name,
        style: const TextStyle(fontSize: AppDoubles.bigFontSize),
      ),
    );
  }
}
