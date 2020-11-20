import 'package:flutter/material.dart';
import 'package:neurodb/app/app.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';

void main() {
  setupLocator();
  runApp(NeuroDB());
}
