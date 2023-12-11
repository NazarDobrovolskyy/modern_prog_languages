# Concentration Game in Dart

## Overview:
The Concentration game is a memory matching game where the player needs to flip pairs of cards to find matching pairs. The game involves a deck of cards, each with a unique content (emoji in this case), and the player's goal is to find all matching pairs by flipping cards.

## Code Structure:
The Dart implementation of the Concentration game consists of three main files: main.dart, concentration.dart, and card.dart.

### main.dart:

The main.dart file demonstrates the usage of the Concentration class by creating an instance (conc) and flipping cards. It prints the results of each card flip, showing whether it's the first flip, if it's a match, or if an exception occurs when trying to flip an already matched card.
```
import "concentration.dart";
import "card.dart";

main() {
    Concentration conc = new Concentration(false, 6);
    print(conc.flipCard(4).matched);
    print(conc.flipCard(5).matched);
    print(conc.flipCard(4).matched); // Exception occurs here
}
```

### concentration.dart:

The Concentration class is responsible for managing the game state, including the number of moves, the timer for a time-based game, and the list of cards for the current game.

It has methods like flipCard to handle card flips and checks for matches or mismatches.

The startTimer method initiates a timer that prints "GAME OVER" after a specified duration.
### card.dart:

The Card class represents an individual card in the game. Each card has a content (emoji), an ID, and flags to track whether it is flipped or matched.
The flipCard method toggles the flipped state of the card, and the matchCard method sets the matched flag.

## Execution and Results:
When running dart main.dart, the output shows the sequence of card flips and their results. The results indicate whether it's the first flip, if it's a match, or if an exception occurs when attempting to flip an already matched card.

```dart main.dart```

```
it's first flip
false
it's match
true
Unhandled exception:
Exception: Sorry, a match has already been found for this card
#0      Concentration.flipCard (file:///Users/outjack/Documents/lnu/modern%20prog%20languages/dart/concentration.dart:59:13)
#1      main (file:///Users/outjack/Documents/lnu/modern%20prog%20languages/dart/main.dart:8:16)
#2      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:297:19)
#3      _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:192:12)
```

### Explanation:

The first flip is indicated by "it's first flip."

The second flip shows that it's not a match, and the result is false.

The third flip results in a match, and the result is true.

An exception is thrown when attempting to flip a card that has already been matched.

## Improvements:

The game logic and error handling can be enhanced for a smoother gaming experience.
Consider adding a user interface, either with a command-line interface or a graphical interface using a Flutter, to make the game interactive.
Additional features, such as scoring, different difficulty levels, or more complex matching patterns, can be implemented to enhance gameplay.