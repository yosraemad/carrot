import 'package:carrot_app/models/user/bloc/user_bloc.dart';
import 'package:carrot_app/view_models/product_view_model.dart';
import 'package:carrot_app/views/cart_page/cart_page.dart';
import 'package:carrot_app/views/cart_page/widgets/cart_appbar.dart';
import 'package:carrot_app/views/home_page/widgets/carousel.dart';
import 'package:carrot_app/views/home_page/widgets/categories_grid.dart';
import 'package:carrot_app/views/home_page/widgets/home_appbar.dart';
import 'package:carrot_app/views/profile_page/profile_screen.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void goHome() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  PreferredSizeWidget? appbar = const HomeAppBar();
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
      CartPage(
        goHome: goHome,
      ),
      const Center(
        child: Text("Campaign"),
      ),
      const ProfileScreen(),
    ];

    final userBloc = context.watch<UserBloc>();
    late final Future getProducts = ProductViewModel().getUserProducts(context);
    return Scaffold(
      appBar: appbar,
      body: FutureBuilder(
          future: getProducts,
          builder: (context, snapshot) {
            if (!snapshot.hasData && _selectedIndex == 2) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return _widgetOptions.elementAt(_selectedIndex);
          }),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: ((value) {
            if (value == 2) {
              setState(() {
                appbar = const CartAppBar();
                _selectedIndex = value;
              });
            } else if (value == 4) {
              setState(() {
                appbar = const ProfilePageAppBar();
                _selectedIndex = value;
              });
            } else {
              setState(() {
                appbar = const HomeAppBar();
                _selectedIndex = value;
              });
            }
          }),
          currentIndex: _selectedIndex,
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
          ]),
    );
  }
}
