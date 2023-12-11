# Concentration Game in Swift

## Card Class
- The `Card` class represents a playing card in the Concentration game.
- It has properties for `flipped` (whether the card is face-up), `matched` (whether the card is already matched), `content` (the emoji or image on the card), and `cardId` (a unique identifier for the card).
- The class provides methods for flipping the card and marking it as matched.

## Concentration Class
- The `Concentration` class manages the game logic for Concentration.
- It initializes with a specified number of cards, creating pairs of cards with emoji content.
- The `flipCard` method is responsible for handling card flips, checking for matches, and updating the game state.
- The class keeps track of the number of moves, the last flipped card ID, and the cards for the current game.
- Error handling is in place to ensure that the provided number of cards is within the valid range.
- The game logic differentiates between the first flip, a match, and a non-match.
- The `main` function demonstrates the usage of the `Concentration` class by creating an instance and flipping cards.

## Usage
```
func main() {
    let conc = Concentration(number: 6)
    print(conc.flipCard(id: 4).matched)
    print(conc.flipCard(id: 5).matched)
    print(conc.flipCard(id: 4).matched)
}


// Run the program
main()
```

## Execution and Results:
When running contents.swift, the output shows the sequence of card flips and their results. The results indicate whether it's the first flip, if it's a match, or if an exception occurs when attempting to flip an already matched card.

```
it's the first flip
false
it's a match
true
ConcentrationGame.playground/contents.swift:60: Fatal error: Sorry, a match has already been found for this card
```

### Explanation:

The first flip is indicated by "it's first flip."

The second flip shows that it's not a match, and the result is false.

The third flip results in a match, and the result is true.

An exception is thrown when attempting to flip a card that has already been matched.

## Improvements:

The game logic and error handling can be enhanced for a smoother gaming experience.
Consider adding a user interface, either with a command-line interface or a graphical interface, to make the game interactive.
Additional features, such as scoring, different difficulty levels, or more complex matching patterns, can be implemented to enhance gameplay.