import 'package:carrot_app/bloc/app_bloc.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: PrimaryPalette.colors,
            scaffoldBackgroundColor: const Color(0xffFCFCFC)),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              context.read<AppBloc>().add(SignIn(userId: snapshot.data!.uid));
              context.read<AppBloc>().add(const SetCart());
              return const HomePage();
            }
            return const LoginPage();
          },
        ),
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          SignUpPage.routeName: (context) => const SignUpPage(),
          HomePage.routeName: (context) => const HomePage(),
          ItemPage.routeName: (context) => const ItemPage(),
          OrderPlacedScreen.routeName: (context) => const OrderPlacedScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == CategoryPage.routeName) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => const CategoryPage(),
              transitionsBuilder: (_, animation, __, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

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
