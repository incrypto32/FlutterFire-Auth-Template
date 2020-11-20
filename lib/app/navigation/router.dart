import 'package:auto_route/auto_route_annotations.dart';
import 'package:neurodb/ui/views/home/home_view.dart';
import 'package:neurodb/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: HomeView),
  MaterialRoute(page: StartUpView, initial: true),
])
class $NeuroRouter {}
