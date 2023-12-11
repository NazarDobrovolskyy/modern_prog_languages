import Foundation

class Card {
    var flipped = false
    var matched = false
    let content: String
    let cardId: Int
    
    init(content: String, cardId: Int) {
        self.content = content
        self.cardId = cardId
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.content == rhs.content
    }
    
    func flipCard() {
        flipped = !flipped
    }
    
    func matchCard() {
        matched = true
    }
}

class Concentration {
    var numberOfCards: Int
    var movesCounter = 0
    var lastFlippedId = -1
    var cardsForCurrentGame: [Card]
    
    init(number: Int) {

        if number > 12 || number < 2 {
            fatalError("Sorry, please provide a number between 2 and 12")
        }
        
        numberOfCards = number
        cardsForCurrentGame = Array(_allCards.prefix(number * 2))
    }
    
    private let _allCards: [Card] = [
        Card(content: "😇", cardId: 0),  Card(content: "😇", cardId: 1),
        Card(content: "😁", cardId: 2),  Card(content: "😁", cardId: 3),
        Card(content: "😍", cardId: 4),  Card(content: "😍", cardId: 5),
        Card(content: "🥰", cardId: 6),  Card(content: "🥰", cardId: 7),
        Card(content: "🙃", cardId: 8),  Card(content: "🙃", cardId: 9),
        Card(content: "😘", cardId: 10), Card(content: "😘", cardId: 11),
        Card(content: "😎", cardId: 12), Card(content: "😎", cardId: 13),
        Card(content: "😂", cardId: 14), Card(content: "😂", cardId: 15),
        Card(content: "😊", cardId: 16), Card(content: "😊", cardId: 17),
        Card(content: "😣", cardId: 18), Card(content: "😣", cardId: 19),
        Card(content: "🥳", cardId: 20), Card(content: "😣", cardId: 21),
        Card(content: "🤪", cardId: 22), Card(content: "😣", cardId: 23),
    ]
    
    func flipCard(id: Int) -> Card {
        if cardsForCurrentGame[id].matched {
            fatalError("Sorry, a match has already been found for this card")
        }
        
        if lastFlippedId != -1 {
            if cardsForCurrentGame[id] == cardsForCurrentGame[lastFlippedId] {
                print("it's a match")
                cardsForCurrentGame[id].matchCard()
                cardsForCurrentGame[lastFlippedId].matchCard()
            } else {
                print("it's not a match")
                cardsForCurrentGame[id].flipCard()
                cardsForCurrentGame[lastFlippedId].flipCard()
            }
            
            lastFlippedId = -1
        } else {
            print("it's the first flip")
            cardsForCurrentGame[id].flipCard()
            lastFlippedId = id
        }
        
        return cardsForCurrentGame[id]
    }
    
    
}

func main() {
    let conc = Concentration(number: 6)
    print(conc.flipCard(id: 4).matched)
    print(conc.flipCard(id: 5).matched)
    print(conc.flipCard(id: 4).matched)
}

// Run the program
main()
