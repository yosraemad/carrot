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
      backgroundColor: Colors.white,
      elevation: 0.2,
    );
  }
}
