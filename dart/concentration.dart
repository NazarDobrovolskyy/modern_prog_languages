import 'dart:async';
import "card.dart";

class Concentration {
  late final bool gameByTime;
  late final int numberOfCards;
  int _movesCounter = 0;
  int _lastFlippedId = -1;

  Concentration(bool byTime, int number) {
    // _selectNumberOfPairsOfCards(number);
    this.gameByTime = byTime;
    if (byTime) {
      startTimer();
    }

    if (number > 12 || number < 2) {
      throw Exception('Sorry, please provide number between 2 and 12');
    }
    this.numberOfCards = number;
    List<Card> playableCards =
        new List<Card>.from(_allCards.sublist(0, number * 2));
    this.cardsForCurrentGame = playableCards;
  }

  List<Card> _allCards = [
    new Card("😇", 0),
    new Card("😇", 1),
    new Card("😁", 2),
    new Card("😁", 3),
    new Card("😍", 4),
    new Card("😍", 5),
    new Card("🥰", 6),
    new Card("🥰", 7),
    new Card("🙃", 8),
    new Card("🙃", 9),
    new Card("😘", 10),
    new Card("😘", 11),
    new Card("😎", 12),
    new Card("😎", 13),
    new Card("😂", 14),
    new Card("😂", 15),
    new Card("😊", 16),
    new Card("😊", 17),
    new Card("😣", 18),
    new Card("😣", 19),
    new Card("🥳", 20),
    new Card("😣", 21),
    new Card("🤪", 22),
    new Card("😣", 23),
  ];

  late final List<Card> cardsForCurrentGame;

  int get movesCounter {
    return _movesCounter;
  }

  Card flipCard(id) {
    if (cardsForCurrentGame[id].matched) {
      throw Exception('Sorry, a match has already been found for this card');
    }
    if (_lastFlippedId != -1) {
      /// if a match
      if (cardsForCurrentGame[id] == cardsForCurrentGame[_lastFlippedId]) {
        print("it's match");
        cardsForCurrentGame[id].matchCard();
        cardsForCurrentGame[_lastFlippedId].matchCard();

        /// if not a match
      } else {
        print("it's not match");
        cardsForCurrentGame[id].flipCard();
        cardsForCurrentGame[_lastFlippedId].flipCard();
      }
      _lastFlippedId = -1;
    } else {
      print("it's first flip");
      cardsForCurrentGame[id].flipCard();
      _lastFlippedId = id;
    }

    if (!this.gameByTime) {
      this._movesCounter++;
    }

    return cardsForCurrentGame[id];
  }

  int _allDuration = 5;
  // only prints GAME OVER at the moment
  void startTimer() {
    Timer(Duration(seconds: _allDuration), () {
      print("GAME OVER");
    });
  }
}
