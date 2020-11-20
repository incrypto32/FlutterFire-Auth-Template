import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/app/navigation/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class NeuroDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neuro DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: ExtendedNavigator.builder(
        navigatorKey: locator<NavigationService>().navigatorKey,
        router: NeuroRouter(),
        builder: (context, child) => Builder(
          builder: (ctx) => child,
        ),
      ),
    );
  }
}
