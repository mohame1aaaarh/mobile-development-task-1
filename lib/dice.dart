import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value;

  const Dice({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getDiceIcon(value),
      size: 80,
      color: Colors.amber,
    );
  }

  IconData _getDiceIcon(int value) {
    switch (value) {
      case 1:
        return Icons.diamond;
      case 2:
        return Icons.diamond;
      case 3:
        return Icons.diamond;
      case 4:
        return Icons.diamond;
      case 5:
        return Icons.star;
      case 6:
        return Icons.star;
      default:
        return Icons.star;
    }
  }
}