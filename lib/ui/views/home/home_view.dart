import 'package:flutter/material.dart';
import 'package:neurodb/app/architecture/view_builder.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';
import 'package:neurodb/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = HomeViewModel();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ViewBuilder<HomeViewModel>(
              modelBuilder: (ctx) => homeViewModel,
              builder: (context, model, child) => Text(
                "${model.counter}",
              ),
            ),
            RaisedButton(
              onPressed: () {
                locator<FirebaseService>().authService.logout();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeViewModel.updateCounter,
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
