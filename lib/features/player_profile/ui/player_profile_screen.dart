import 'package:flutter/material.dart';
import 'package:foot_fire/features/search/data/models/player_model.dart';

class PlayerProfileScreen extends StatelessWidget {
  final Player player;
  const PlayerProfileScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Player Profile'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset('assets/images/player_profile.png'),
          ),
          const SizedBox(height: 16),
          const Text('Player Name: John Doe'),
          const SizedBox(height: 8),
          const Text('Age: 25'),
          const SizedBox(height: 8),
          const Text('Country: United States'),
          const SizedBox(height: 8),
          const Text('Position: Forward'),
          const SizedBox(height: 8),
          const Text('Height: 7ft 3in'),
          const SizedBox(height: 8),
          const Text('Weight: 210 lbs'),
        ],
      ),
    ));
  }
}
