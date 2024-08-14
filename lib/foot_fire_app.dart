import 'package:flutter/material.dart';
import 'package:foot_fire/core/routing/app_routing.dart';
import 'package:foot_fire/core/routing/routes.dart';

class FootFireApp extends StatelessWidget {
  final AppRouting appRouter;
  const FootFireApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
