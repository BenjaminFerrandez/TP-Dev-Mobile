import 'package:flutter/material.dart';
import '../data/games_data.dart';
import '../widgets/game_card.dart';

class BoutiqueScreen extends StatelessWidget {
  const BoutiqueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gamesData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GameCard(game: gamesData[index]),
        );
      },
    );
  }
}
