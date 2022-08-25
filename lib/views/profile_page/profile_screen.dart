import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_icons.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/views/profile_page/widgets/change_language.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_switch.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_text.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDoubles.profilePageHorizontalPadding,
            vertical: AppDoubles.profilePageVerticalPadding),
        width: double.infinity,
        child: ListView(
          children: [
            const ProfileText(AppStrings.profileSectionText),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.profileIconSvg),
                text: AppStrings.editProfileText),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.changePasswordIconSvg),
                text: AppStrings.changePasswordText),
            const SizedBox(height: AppDoubles.profilePageBreak),
            const ProfileText(AppStrings.generalSectionText),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.ordersIconSvg),
                text: AppStrings.ordersText),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.favoritesIconSvg),
                text: AppStrings.favoritesText),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.addressesIconSvg),
                text: AppStrings.addressesText),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.cardsIconSvg),
                text: AppStrings.cardsText),
            const SizedBox(height: AppDoubles.profilePageBreak),
            const ProfileText(AppStrings.settingsSectionText),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.notificationsIconSvg),
                text: AppStrings.notificationsText,
                trailing: const ProfileSwitch()),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.darkModeIconSvg),
                text: AppStrings.darkModeText,
                trailing: const ProfileSwitch()),
            ProfileTile(
                icon: SvgPicture.asset(AppIcons.languageIconSvg),
                text: AppStrings.languageText,
                trailing: const ChangeLanguage()),
            ProfileTile(
              icon: SvgPicture.asset(AppIcons.logoutIconSvg),
              text: AppStrings.logoutText,
              trailing: const SizedBox(),
              onTap: () {
                // * tell appbloc to logout the user
                context.read<AppBloc>().add(const SignOut());
              },
            )
          ],
        ));
  }
}
