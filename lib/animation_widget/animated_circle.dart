import 'dart:math';

import 'package:expenses/widgets/cricle.dart';
import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  final Color circle_color;
  const AnimatedCircle({super.key, required this.circle_color});

  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _moveController;
  late final Animation _circleStart;
  late final Animation _circleSweep;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15))
          ..forward()
          ..addListener(() {
            if (_controller.isCompleted) {
              _controller.repeat();
            }
          });

    _moveController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..forward()
          ..addListener(() {
            if (_moveController.isCompleted) {
              _moveController.repeat();
            }
          });

    _circleStart = Tween<double>(begin: 0, end: 2 * pi).animate(
        CurvedAnimation(parent: _moveController, curve: Curves.easeInOutQuart));
    _circleSweep = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: pi / 2), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: pi / 2, end: 0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: pi / 2), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: pi / 2, end: 0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: pi / 2), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: pi / 2, end: 0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: pi / 2), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: pi / 2, end: 0), weight: 1)
    ]).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Center(
          child: CircleDraw(
            start_angle: _circleStart.value,
            sweep_angle: _circleSweep.value,
            screen_width: screen_width,
            circle_color: widget.circle_color,
          ),
        );
      },
    );
  }
}
