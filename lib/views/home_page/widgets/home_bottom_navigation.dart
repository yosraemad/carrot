import 'package:carrot_app/views/cart_page/widgets/cart_appbar.dart';
import 'package:carrot_app/views/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: ((value) {
          context.read<HomeBloc>().add(ChangeIndex(value));
        }),
        currentIndex: context.watch<HomeBloc>().state.index,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/home_icon.svg"),
            label: "Home",
            activeIcon: SvgPicture.asset(
              "assets/images/home_icon.svg",
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/search_icon.svg"),
            label: "Search",
            activeIcon: SvgPicture.asset(
              "assets/images/search_icon.svg",
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/cart_icon.svg"),
            label: "Cart",
            activeIcon: SvgPicture.asset(
              "assets/images/cart_icon.svg",
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/campaign_icon.svg"),
            label: "Campaigns",
            activeIcon: SvgPicture.asset(
              "assets/images/campaign_icon.svg",
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/profile_icon.svg"),
            label: "Profile",
            activeIcon: SvgPicture.asset(
              "assets/images/profile_icon.svg",
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]);
  }
}
