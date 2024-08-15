import 'package:flutter/material.dart';
import 'package:foot_fire/core/dependancy_injection/di.dart';
import 'package:foot_fire/core/routing/app_routing.dart';
import 'package:foot_fire/foot_fire_app.dart';

void main() {
  setupGetIt();
  runApp(FootFireApp(
    appRouter: AppRouting(),
  ));
}
