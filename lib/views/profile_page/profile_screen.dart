import 'package:carrot_app/view_models/user_view_model.dart';
import 'package:carrot_app/views/profile_page/widgets/change_language.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_switch.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_text.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        width: double.infinity,
        child: ListView(
          children: [
            const ProfileText("Account"),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/user.svg"),
                text: "Edit Profile"),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/key.svg"),
                text: "Change Password"),
            const SizedBox(height: 20),
            const ProfileText("General"),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/box.svg"),
                text: "Orders"),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/heart.svg"),
                text: "Favorites"),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/marker.svg"),
                text: "My Addresses"),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/cart.svg"),
                text: "My Cards"),
            const SizedBox(height: 20),
            const ProfileText("App Settings"),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/bell.svg"),
                text: "Notifications",
                trailing: const ProfileSwitch()),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/moon.svg"),
                text: "Dark Mode",
                trailing: const ProfileSwitch()),
            ProfileTile(
                icon: SvgPicture.asset("assets/images/profile_page/lang.svg"),
                text: "Language",
                trailing: const ChangeLanguage()),
            ProfileTile(
              icon: SvgPicture.asset("assets/images/profile_page/logout.svg"),
              text: "Logout",
              trailing: const SizedBox(),
              onTap: () {
                UserViewModel().signOutUser(context);
              },
            )
          ],
        ));
  }
}
