import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_font_weights.dart';
import 'package:carrot_app/resources/app_images.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/resources/app_text_aligns.dart';
import 'package:carrot_app/views/cart_page/cart_page.dart';
import 'package:carrot_app/views/home_page/bloc/home_bloc.dart';
import 'package:carrot_app/widgets/custom/form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Screen that shows when the cart is empty
class EmptyCart extends StatelessWidget {
  const EmptyCart({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.emptyCartImage),
        const Padding(
          padding: EdgeInsets.only(
              top: AppDoubles.emptyCartTextTopPadding,
              bottom: AppDoubles.emptyCartTextBottomPadding),
          child: Text(
            AppStrings.emptyCartText,
            style: TextStyle(
                fontWeight: AppFontWeights.emptyCartFontWeight,
                fontSize: AppDoubles.bigFontSize),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDoubles.makingChoiceHorizontalPadding),
          child: Text(
            AppStrings.makeChoiceText,
            style: TextStyle(fontSize: AppDoubles.normalFontSize),
            textAlign: AppTextAligns.emptyCartTextAlign,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDoubles.startShoppingHorizontalPadding,
              vertical: AppDoubles.startShoppingVerticalPadding),
          child: FormButton(
              text: AppStrings.startShoppingText,
              onPressed: () {
                context.read<HomeBloc>().add(const ChangeIndex(0));
              }),
        ),
      ],
    );
  }
}
