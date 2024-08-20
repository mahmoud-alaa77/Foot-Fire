import 'package:flutter/material.dart';
import 'package:foot_fire/features/matches/ui/widgets/match_card_item.dart';

class MatchesScreenBody extends StatelessWidget {
  const MatchesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const MatchCardItem();
      },
    );
  }
}
