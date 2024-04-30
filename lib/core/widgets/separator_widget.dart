import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  const MySeparator({super.key, this.height = 6, this.color = Colors.black, this.direction});

  final double height;
  final Color color;
  final Axis? direction;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainHeight();
        const dashWidth = 1.0;
        final dashHeight = height;
        final dashCount = (boxHeight / (2 * height)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction??Axis.vertical,
          children: List.generate(
            dashCount,
            (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
