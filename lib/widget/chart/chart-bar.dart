import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key , required this.fill});
  final double fill;
  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                color: isDark ? Theme.of(context).colorScheme.secondary:
                Theme.of(context).colorScheme.primary.withOpacity(.6)
          ),
           
          ),
        ),
      ),
    );
  }
}