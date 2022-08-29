import 'dart:async';

import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/views/category_page/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCartAnimation extends StatefulWidget {
  const ChangeCartAnimation(
      {Key? key, required this.child, required this.startAnimation})
      : super(key: key);

  final Widget child;
  final bool startAnimation;

  @override
  State<ChangeCartAnimation> createState() => _ChangeCartAnimationState();
}

class _ChangeCartAnimationState extends State<ChangeCartAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  Timer? _timer;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: (AppDoubles.animationsDuration / 2 * 100).toInt()));
    _animationController.value = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.startAnimation) {
      _animationController.repeat(reverse: true);
      _timer = Timer(const Duration(seconds: 1), () {
        setState(() {
          _animationController.stop();
          _timer?.cancel();
          _animationController.value = 1;
          BlocProvider.of<CategoryBloc>(context).add(const EndAnimation());
        });
      });
    }
    return FadeTransition(
      opacity: _animationController,
      child: _animationController.isDismissed
          ? Container(
              child: widget.child,
            )
          : widget.child,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }
}
