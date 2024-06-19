import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_app/Bloc/CartBloc/Bloc.dart';
import 'package:freedom_app/Bloc/DropDown/Bloc.dart';
import 'package:freedom_app/Bloc/Rememberme/Bloc.dart';
import 'package:freedom_app/pages/CartPage.dart';
import 'package:freedom_app/pages/CheckOutPage.dart';
import 'package:freedom_app/pages/HeadOutPage.dart';
import 'package:freedom_app/pages/LoginPage.dart';
import 'package:freedom_app/pages/ProductPage.dart';

void main() {
  runApp(const FreedomApp());
}

class FreedomApp extends StatelessWidget {
  const FreedomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<RememberMeBloc>(
            create: (context) => RememberMeBloc(),
          ),
          BlocProvider<DropdownBloc>(
            create: (context) => DropdownBloc(),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(),
          ),
        ],
        child: const LoginPage(),
      ),
      routes: {
        '/checkout': (context) => const CheckOutPage(),
        '/cartpage': (context) => const CartPage(),
        '/headout' : (context) => const headoutpage(),
        '/ProductPage' : (context) => const ProductPage()
      },
    );
  }
}