import 'package:flutter/material.dart';
import 'package:neurodb/app/architecture/view_model.dart';
import 'package:provider/provider.dart';

class ViewBuilder<T extends ViewModel> extends StatelessWidget {
  const ViewBuilder(
      {@required this.modelBuilder, this.child, @required this.builder});
  final ChangeNotifier Function(BuildContext) modelBuilder;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: modelBuilder,
      builder: (context, _) => Consumer<T>(
        builder: builder,
        child: child,
      ),
    );
  }
}
