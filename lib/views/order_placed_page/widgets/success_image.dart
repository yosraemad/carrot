import 'package:carrot_app/constants/app_images.dart';
import 'package:flutter/material.dart';

// Image that appears when the user checks out the cart
class SuccessImage extends StatelessWidget {
  const SuccessImage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        AppImages.successImage,
      ),
    );
  }
}
