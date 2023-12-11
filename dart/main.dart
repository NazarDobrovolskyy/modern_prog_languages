import "concentration.dart";
import "card.dart";

main() {
  Concentration conc = new Concentration(false, 6);
  print(conc.flipCard(4).matched);
  print(conc.flipCard(5).matched);
  print(conc.flipCard(4).matched);
}
