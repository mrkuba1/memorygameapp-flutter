import 'package:flutter/material.dart';

enum CardState { hidden, visiable, guessed }

class CardItem {
  CardItem(
    this.value, {
    this.state = CardState.hidden,
  });

  final int value;
  CardState state;

  IconData get icon {
    switch (value) {
      case 1:
        return Icons.apple;
      case 2:
        return Icons.fastfood;
      case 3:
        return Icons.woman;
      case 4:
        return Icons.map;
      case 5:
        return Icons.book;
      case 6:
        return Icons.watch;
      case 7:
        return Icons.hotel;
      case 8:
        return Icons.money;
      default:
        return Icons.warning;
    }
  }

  Color get color {
    switch (value) {
      case 1:
        return Colors.black;
      case 2:
        return Colors.white;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.green;
      case 5:
        return Colors.orange;
      case 6:
        return Colors.red;
      case 7:
        return Colors.blue;
      case 8:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
