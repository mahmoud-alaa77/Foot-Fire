import 'package:flutter/material.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/team_list_item.dart';

class TeamsScreenBody extends StatelessWidget {
  const TeamsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return const TeamListItem();
        });
  }
}
