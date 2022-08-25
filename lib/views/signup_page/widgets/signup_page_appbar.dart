import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:flutter/material.dart';

// Sign Up AppBar shown on the top of the sign up page
class SignUpPageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const SignUpPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparentAppBarColor,
      elevation: AppDoubles.transparentAppBarElevation,
      leading: IconButton(
        splashColor: AppColors.noSplashIconButtonColor,
        highlightColor: AppColors.noSplashIconButtonColor,
        icon: const Icon(
          AppIcons.backIcon,
          size: AppDoubles.backButtonSize,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
