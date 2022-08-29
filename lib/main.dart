import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_curves.dart';
import 'package:carrot_app/resources/app_offsets.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/views/category_page/category_page.dart';
import 'package:carrot_app/views/home_page/home_page.dart';
import 'package:carrot_app/views/item_page/item_page.dart';
import 'package:carrot_app/views/login_page/login_page.dart';
import 'package:carrot_app/views/order_placed_page/order_placed_screen.dart';
import 'package:carrot_app/views/signup_page/signup_page.dart';
import 'package:carrot_app/utils/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  // * Initializing Firebase before running the app
  // ! This is required in order to run any firebase service
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// The starting point of the application
// * Listens to the app wide bloc to provide it for all it's children
class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
      ],
      child: MaterialApp(
        title: AppStrings.materialAppString,
        // Defining the theme of the app
        theme: ThemeData(
            primarySwatch: PrimaryPalette.colors,
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor),
        home: StreamBuilder<User?>(
          // * Listens to any changes in the firebase auth and runs the builder when it changes
          // This is useful because now you don't have to use Navigator to navigate when
          // signing in signing up or signing out
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // if the user is signed in
              // * updates the [AppBloc] with the user id and the user's cart
              context.read<AppBloc>().add(SignIn(userId: snapshot.data!.uid));
              context.read<AppBloc>().add(const SetCart());
              return const HomePage();
            }
            // if the user is signed out
            return const LoginPage();
          },
        ),
        // defining all app routes
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          SignUpPage.routeName: (context) => const SignUpPage(),
          HomePage.routeName: (context) => const HomePage(),
          OrderPlacedScreen.routeName: (context) => const OrderPlacedScreen(),
        },
        // * changes the default navigation animation of the category and item pages
        // The animation makes the screens of the category and item pages appear from the bottom up
        onGenerateRoute: (settings) {
          if (settings.name == CategoryPage.routeName) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => const CategoryPage(),
              transitionsBuilder: (_, animation, __, child) {
                const begin = AppOffsets.routingAnimationBeginningOffset;
                const end = AppOffsets.routingAnimationEndingOffset;
                const curve = AppCurves.routingAnimationCurve;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          }
          if (settings.name == ItemPage.routeName) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => const ItemPage(),
              transitionsBuilder: (_, animation, __, child) {
                const begin = AppOffsets.routingAnimationBeginningOffset;
                const end = AppOffsets.routingAnimationEndingOffset;
                const curve = AppCurves.routingAnimationCurve;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          }
        },
      ),
    );
  }
}
