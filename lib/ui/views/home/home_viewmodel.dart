import 'package:neurodb/app/architecture/view_model.dart';

class HomeViewModel extends ViewModel {
  String _title = 'Home View';
  String get title => _title;

  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }
}
