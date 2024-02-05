import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const GameButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(50.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              )),
          onPressed: onPressed,
          child: Text(title),
        ));
  }
}
