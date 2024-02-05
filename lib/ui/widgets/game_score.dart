import 'package:flutter/material.dart';

class GameScore extends StatelessWidget {
  final int score;
  const GameScore({
    Key? key,
    required this.score,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Card(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const Expanded(
              child: Icon(Icons.score),
            ),
            Expanded(
              child: Text('$score'),
            ),
          ]),
        ),
      ),
    );
  }
}
