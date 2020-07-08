import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSlidingSegmentedTabBar extends StatefulWidget {
  final int currentIndex;
  final List<String> labels;
  final EdgeInsetsGeometry labelPadding;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final TabController controller;

  const CupertinoSlidingSegmentedTabBar({
    Key key,
    this.currentIndex = 0,
    @required this.labels,
    @required this.controller,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.labelPadding = const EdgeInsets.all(4),
  })  : assert(currentIndex != null, 'currentIndex should not be null'),
        assert(controller != null, 'controller should not be null'),
        assert(labels != null, 'labels should not be null'),
        assert(labels.length == controller.length,
            'Length of cntrollers and labels should be same'),
        assert(currentIndex > -1 && currentIndex < controller.length,
            'currentIndex should be greater than -1 and less than ${labels.length}'),
        super(key: key);
  @override
  _CupertinoSlidingSegmentedTabBarState createState() =>
      _CupertinoSlidingSegmentedTabBarState();
}

class _CupertinoSlidingSegmentedTabBarState
    extends State<CupertinoSlidingSegmentedTabBar> {
  int index;
  @override
  void initState() {
    super.initState();
    index = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final children = HashMap<int, Widget>();
    for (int i = 0; i < widget.labels.length; i++) {
      final tab = widget.labels[i];
      children[i] = Padding(
        padding: widget.labelPadding,
        child: Text(
          tab,
          style: TextStyle(
            color: i == index
                ? widget.selectedLabelColor ?? Theme.of(context).primaryColor
                : widget.unselectedLabelColor ??
                    Theme.of(context).textTheme.headline6.color,
          ),
        ),
      );
    }
    return CupertinoSlidingSegmentedControl(
      groupValue: index,
      children: children,
      onValueChanged: (index) {
        widget.controller.animateTo(index);
        setState(() {
          this.index = index;
        });
      },
    );
  }
}
