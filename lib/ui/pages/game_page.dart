import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memorygameapp/models/card_item.dart';
import 'package:memorygameapp/models/game.dart';
import 'package:memorygameapp/ui/widgets/game_button.dart';
import 'package:memorygameapp/ui/widgets/game_score.dart';
import 'package:memorygameapp/ui/widgets/game_timer.dart';
import 'package:memorygameapp/ui/widgets/memory_card.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Timer? timer;
  Game? game;

  @override
  void initState() {
    super.initState();
    game = Game(4);
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        game!.time = game!.time + 1;
      });
      if (game!.isGameOver) {
        timer!.cancel();
      }
    });
  }

  startScoring() {
    setState(() {
      game!.score = game!.score + 1;
    });
  }

  void _resetGame() {
    game!.resetGame();
    setState(() {
      timer!.cancel();
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memory Game"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                    child: Row(
                  children: [
                    GameTimer(
                      timer: game!.time,
                    ),
                    GameScore(score: game!.score)
                  ],
                ))),
            Expanded(
              flex: 3,
              child: GridView.count(
                crossAxisCount: game!.gridSize,
                children: List.generate(game!.cards.length, (index) {
                  return MemoryCard(
                    index: index,
                    cardItem: game!.cards[index],
                    onCardPressed: (int index) {
                      if (game!.cards[index].state == CardState.hidden) {
                        startScoring();
                      }
                      game!.onCardPressed(index);
                    },
                  );
                }),
              ),
            ),
            if (game!.isGameOver)
              Expanded(
                flex: 1,
                child: GameButton(
                  title: "Try Again",
                  onPressed: () => _resetGame(),
                ),
              )
            else
              const Expanded(
                flex: 1,
                child: SizedBox(),
              )
          ],
        ),
      ),
    );
  }
}
