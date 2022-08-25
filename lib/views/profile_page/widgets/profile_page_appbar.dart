import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:flutter/material.dart';

// Profile Page AppBar shown on the top of the profile page
class ProfilePageAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProfilePageAppBar({key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Profile"),
      backgroundColor: AppColors.appBarColor,
      elevation: AppDoubles.profilePageElevation,
    );
  }
}
