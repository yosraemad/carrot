import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:carrot_app/views/cart_page/cart_page.dart';
import 'package:carrot_app/views/cart_page/widgets/cart_appbar.dart';
import 'package:carrot_app/views/home_page/bloc/home_bloc.dart';
import 'package:carrot_app/views/home_page/widgets/carousel.dart';
import 'package:carrot_app/views/home_page/widgets/categories_grid.dart';
import 'package:carrot_app/views/home_page/widgets/home_appbar.dart';
import 'package:carrot_app/views/home_page/widgets/home_bottom_navigation.dart';
import 'package:carrot_app/views/profile_page/profile_screen.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  const HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! List of Widgets that the bottom navigation bar shows according to the index it's at
    final List<Widget> _widgetOptions = [
      Column(
        children: const [
          Carousel(),
          Expanded(child: CategoriesGrid()),
        ],
      ),
      const Center(
        child: Text(AppStrings.searchText),
      ),
      const CartPage(),
      const Center(
        child: Text(AppStrings.campaignText),
      ),
      const ProfileScreen(),
    ];
    // * to notify the home page whenever a change happens in the app bloc
    final appBloc = context.watch<AppBloc>();

    // * Creates a bloc for the home page and all of its widgets to sync state between them
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: state.appBar,
            body: Builder(builder: (context) {
              if (!appBloc.cartSet && state.index == 2) {
                // shows a circular progress bar when the cart is not fetched from the firestore yet
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // select the widget that corresponds to the index the bottom navigation
                // bar is at
                return _widgetOptions.elementAt(state.index);
              }
            }),
            bottomNavigationBar: const HomeBottomNavigation(),
          );
        },
      ),
    );
  }
}
