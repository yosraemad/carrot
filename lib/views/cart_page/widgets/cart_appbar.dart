import 'package:flutter/material.dart';

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
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 6.0),
          child: Icon(
            Icons.delete_outline,
            size: 35,
          ),
        )
      ],
      backgroundColor: Colors.white,
      title: const Text("Cart"),
    );
  }
}
