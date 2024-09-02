import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/dependancy_injection/di.dart';
import 'package:foot_fire/core/helpers/my_bloc_obsever.dart';
import 'package:foot_fire/core/routing/app_routing.dart';
import 'package:foot_fire/foot_fire_app.dart';

void main()  {
  Bloc.observer = SimpleBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
  runApp(FootFireApp(
    appRouter: AppRouting(),
  ));
  setupGetIt();
}
