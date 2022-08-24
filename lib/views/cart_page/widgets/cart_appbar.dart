import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// App bar that appears on top of the [CartPage]
class CartAppBar extends StatelessWidget with PreferredSizeWidget {
  const CartAppBar({key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      leading: const Icon(
        Icons.close,
        size: 35,
      ),
      actions: [
        InkWell(
          onTap: () => context.read<AppBloc>().add(EmptyCart()),
          child: const Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: Icon(
              Icons.delete_outline,
              size: 35,
            ),
          ),
        )
      ],
      backgroundColor: Colors.white,
      title: const Text("Cart"),
    );
  }
}
