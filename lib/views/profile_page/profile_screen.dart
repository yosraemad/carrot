import 'package:carrot_app/view_models/user_view_model.dart';
import 'package:carrot_app/views/profile_page/widgets/change_language.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_switch.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_text.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        width: double.infinity,
        child: ListView(
          children: [
            const ProfileText("Account"),
            const ProfileTile(icon: Icons.person, text: "Edit const Profile"),
            const ProfileTile(icon: Icons.key, text: "Change Password"),
            const SizedBox(height: 20),
            const ProfileText("General"),
            const ProfileTile(icon: Icons.inventory, text: "Orders"),
            const ProfileTile(icon: Icons.favorite, text: "Favorites"),
            const ProfileTile(icon: Icons.location_on, text: "My Addresses"),
            const ProfileTile(icon: Icons.credit_card, text: "My Cards"),
            const SizedBox(height: 20),
            const ProfileText("App Settings"),
            const ProfileTile(
                icon: Icons.notifications,
                text: "Notifications",
                trailing: ProfileSwitch()),
            const ProfileTile(
                icon: Icons.mode_night,
                text: "Dark Mode",
                trailing: ProfileSwitch()),
            const ProfileTile(
                icon: Icons.g_translate,
                text: "Language",
                trailing: ChangeLanguage()),
            ProfileTile(
              icon: Icons.logout,
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
