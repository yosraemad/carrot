import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/views/category_page/bloc/category_bloc.dart';
import 'package:carrot_app/views/category_page/widgets/change_cart_animation.dart';
import 'package:carrot_app/views/item_page/item_page.dart';
import 'package:carrot_app/views/category_page/widgets/add_to_cart_button.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom GridTile for the Category page frid view
/// @param item: the current item
class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> item;
  const CategoryItem(this.item, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ItemPage.routeName,
              arguments: ItemPageArgs(item));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ChangeCartAnimation(
                      startAnimation: BlocProvider.of<CategoryBloc>(context,
                                  listen: true)
                              .state is CategoryChanged &&
                          BlocProvider.of<CategoryBloc>(context, listen: true)
                                  .state
                                  .changedIndex ==
                              item[AppStrings.idMapKey],
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.offWhite,
                            border: Border.all(
                              color: AppColors.grayishWhite,
                            ),
                            borderRadius: BorderRadius.circular(
                                AppDoubles.categoryItemBorderRadius)),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              AppDoubles.categoryItemImagePadding),
                          child: Image.network(item[AppStrings.imageMapKey]),
                        ),
                      ),
                    ),
                    Positioned(
                      top: AppDoubles.cartButtonTopPosition,
                      right: AppDoubles.cartButtonRightPosition,
                      child: AddToCartButton(Product.fromJson(item)),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "\$${item[AppStrings.priceMapKey]}",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Text(
              item[AppStrings.nameMapKey],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              item[AppStrings.weightMapKey],
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
