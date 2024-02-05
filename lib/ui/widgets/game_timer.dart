import 'package:flutter/material.dart';

class GameTimer extends StatelessWidget {
  final int timer;
  const GameTimer({Key? key, required this.timer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(40),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          const Expanded(child: Icon(Icons.timer)),
          Expanded(child: Text('$timer')),
        ]),
      ),
    );
  }
}
