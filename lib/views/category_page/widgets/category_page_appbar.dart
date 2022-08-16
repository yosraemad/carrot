import 'package:carrot_app/views/category_page/category_page.dart';
import 'package:flutter/material.dart';

class CategoryPageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const CategoryPageAppBar({
    Key? key,
    required this.args,
  }) : super(key: key);

  final CategoryPageArgs args;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: const Icon(
          Icons.chevron_left,
          size: 40,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        args.name,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
