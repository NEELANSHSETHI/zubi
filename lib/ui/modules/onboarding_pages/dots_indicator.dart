import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zubi/utils/colors.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {this.controller,
      this.itemCount,
      this.onPageSelected,
      this.selectedPage,
      this.color: const Color(0xFFe8e8e8)})
      : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;
  final ValueGetter<int> selectedPage;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  Widget _buildDot(int index) {

    if (index < 3)
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: new Container(
          child: new Center(
            child: new Material(
              color: ((controller.page != null
                                      ? controller.page
                                      : controller.initialPage) -
                                  index)
                              .abs() <
                          .5
                  ? primaryColor1
                  : color,
              type: MaterialType.circle,
              child: new Container(
                width: _kDotSize,
                height: _kDotSize,
                child: new InkWell(
                  onTap: () => onPageSelected(index),
                ),
              ),
            ),
          ),
        ),
      );
    else {
      return Text("");
    }
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
