import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/constants/app_strings.dart';
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
      elevation: AppDoubles.itemPageAppBarElevation,
      leading: const Icon(
        AppIcons.close,
        size: AppDoubles.cartAppBarIconSize,
      ),
      actions: [
        InkWell(
          onTap: () => context.read<AppBloc>().add(EmptyCart()),
          child: const Padding(
            padding: EdgeInsets.only(right: AppDoubles.cartAppBarPadding),
            child: Icon(
              AppIcons.delete,
              size: AppDoubles.cartAppBarIconSize,
            ),
          ),
        )
      ],
      backgroundColor: AppColors.white,
      title: const Text(AppStrings.cartText),
    );
  }
}
