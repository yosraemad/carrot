import 'package:carrot_app/bloc/app_bloc.dart';
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
    final List<Widget> _widgetOptions = [
      Column(
        children: const [
          Carousel(),
          Expanded(child: CategoriesGrid()),
        ],
      ),
      const Center(
        child: Text("Search"),
      ),
      const CartPage(),
      const Center(
        child: Text("Campaign"),
      ),
      const ProfileScreen(),
    ];

    final appBloc = context.watch<AppBloc>();
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: state.appBar,
            body: Builder(builder: (context) {
              if (!appBloc.state.cartSet && state.index == 2) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
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
