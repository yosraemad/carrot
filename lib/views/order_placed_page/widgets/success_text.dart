import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// Custom Text for success text
class SuccessText extends StatelessWidget {
  const SuccessText({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.successText,
      style: TextStyle(
          fontWeight: AppFontWeights.bold, fontSize: AppDoubles.bigFontSize),
    );
  }
}
