import 'dart:math';

import 'package:memorygameapp/models/card_item.dart';

class Game {
  int gridSize;
  List<CardItem> cards = [];
  bool isGameOver = false;
  int time = 0;

  Game(this.gridSize) {
    generateCards();
  }

  void generateCards() {
    cards = [];
    for (int i = 0; i < gridSize * gridSize / 2; i++) {
      int cardValue = i + 1;

      cards.add(CardItem(
        cardValue,
        state: CardState.hidden,
      ));
      cards.add(CardItem(
        cardValue,
        state: CardState.hidden,
      ));
    }
    cards.shuffle(Random());
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
    time = 0;
  }

  void onCardPressed(int index) {
    cards[index].state = CardState.visiable;
    List<int> selectedCardIndexes = _getSelectedCardIndexes();

    if (selectedCardIndexes.length == 2) {
      CardItem card1 = cards[selectedCardIndexes[0]];
      CardItem card2 = cards[selectedCardIndexes[1]];
      if (card1.value == card2.value) {
        card1.state = CardState.guessed;
        card2.state = CardState.guessed;
        isGameOver = _isGameOver();
      } else {
        Future.delayed(const Duration(microseconds: 1000), () {
          card1.state = CardState.hidden;
          card2.state = CardState.hidden;
        });
      }
    }
  }

  List<int> _getSelectedCardIndexes() {
    List<int> selectedCardIndexes = [];
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].state == CardState.visiable) {
        selectedCardIndexes.add(i);
      }
    }
    return selectedCardIndexes;
  }

  bool _isGameOver() {
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].state == CardState.hidden) {
        return true;
      }
    }
    return false;
  }
}
