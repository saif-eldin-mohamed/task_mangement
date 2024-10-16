import 'package:flutter/material.dart';
import 'package:task_mangment/core/theming/styles.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Good Morning',
      style: TextThemes.font30Black900Medium,
    );
  }
}
