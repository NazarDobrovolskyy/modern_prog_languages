class Card {
  /// Whether current card is flipped.
  bool _flipped = false;

  /// Whether current card is already matched.
  bool _matched = false;

  /// Card content (image or emoji) for now only emoji (will be changed later).
  final String content;

  /// Index of the current card.
  int _cardId = 0;

  /// If any other card is equal to the current one.
  bool operator ==(anotherCard) =>
      anotherCard is Card && content == anotherCard.content;

  Card(_content, _cardId) : content = _content;

  void flipCard() {
    _flipped = !_flipped;
  }

  void matchCard() {
    _matched = true;
  }

  int get cardId {
    return _cardId;
  }

  bool get flipped {
    return _flipped;
  }

  bool get matched {
    return _matched;
  }
}
