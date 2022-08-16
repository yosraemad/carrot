import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      shadowColor: Colors.grey[100],
      backgroundColor: Colors.white,
      elevation: 1,
      title: Padding(
        padding: const EdgeInsets.only(left: 21.0),
        child: Row(
          children: [
            Container(
              width: 32,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(4, 8),
                )
              ]),
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              "Carrot",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Color(0xff828282)),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: TextButton.icon(
            icon: const Icon(Icons.place, color: Color(0xff828282)),
            onPressed: () {},
            label: const Text(
              "Home",
              style: TextStyle(color: Color(0xff828282), fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
