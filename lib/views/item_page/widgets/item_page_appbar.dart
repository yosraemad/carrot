import 'package:flutter/material.dart';

/// App bar that appears at the top of the [ItemPage]
class ItemPageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const ItemPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: const Icon(
          Icons.chevron_left,
          size: 40,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: const Text("Product Details"),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.favorite_outline,
            size: 30,
          ),
        )
      ],
    );
  }
}
