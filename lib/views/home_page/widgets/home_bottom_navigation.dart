import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:carrot_app/views/cart_page/widgets/cart_appbar.dart';
import 'package:carrot_app/views/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Bottom Navigation Bar for the home screen
class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: AppDoubles.smallFontSize,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.grey,
        onTap: ((value) {
          /// Notify the [HomeBloc] of change in the index value to update the UI
          context.read<HomeBloc>().add(ChangeIndex(value));
        }),

        /// watch the [HomeBloc] for any change in the index value to render the
        /// right icons and change colors of the selected element
        currentIndex: context.watch<HomeBloc>().state.index,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.homeIconSvg),
            label: AppStrings.homeText,
            activeIcon: SvgPicture.asset(
              AppIcons.homeIconSvg,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.searchIconSvg),
            label: AppStrings.searchText,
            activeIcon: SvgPicture.asset(
              AppIcons.searchIconSvg,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.cartIconSvg),
            label: AppStrings.cartText,
            activeIcon: SvgPicture.asset(
              AppIcons.cartIconSvg,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.campaignIconSvg),
            label: AppStrings.campaignText,
            activeIcon: SvgPicture.asset(
              AppIcons.campaignIconSvg,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.accountIconSvg),
            label: AppStrings.accountText,
            activeIcon: SvgPicture.asset(
              AppIcons.accountIconSvg,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]);
  }
}
