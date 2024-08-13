

import 'package:flutter/material.dart';

class FootFireApp extends StatelessWidget {
  const FootFireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'FOOT FIRE',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}