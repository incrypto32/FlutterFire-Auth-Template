import 'package:flutter/material.dart';
import 'package:neurodb/app/architecture/view_builder.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';
import 'package:neurodb/ui/views/auth/login_view.dart';
import 'package:neurodb/ui/views/home/home_view.dart';
import 'package:neurodb/ui/views/loading/splash_screen.dart';
import 'package:neurodb/ui/views/startup/startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewBuilder<StartUpViewModel>(
      modelBuilder: (ctx) => StartUpViewModel(locator<FirebaseService>()),
      builder: (ctx, model, child) {
        if (model.isBusy) {
          return Splash();
        } else if (model.isLoggedIn) {
          return HomeView();
        } else {
          return LoginView();
        }
      },
    );
  }
}
