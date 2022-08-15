import 'package:carrot_app/bloc/user_bloc.dart';
import 'package:carrot_app/pages/category_page.dart';
import 'package:carrot_app/pages/home_page.dart';
import 'package:carrot_app/pages/login_page.dart';
import 'package:carrot_app/pages/signup_page.dart';
import 'package:carrot_app/utils/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserBloc())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: PrimaryPalette.colors,
            scaffoldBackgroundColor: const Color(0xffFCFCFC)),
        initialRoute: "/",
        routes: {
          "/": (context) => const LoginPage(),
          "/sign-up": (context) => const SignUpPage(),
          "/home": (context) => const HomePage(),
          "/category": (context) => const CategoryPage(),
        },
      ),
    );
  }
}
