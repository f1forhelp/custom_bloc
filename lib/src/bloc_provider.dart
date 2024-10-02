import 'package:flutter/foundation.dart';
import 'package:flutter_custom_bloc/flutter_custom_bloc.dart';
import 'package:flutter/widgets.dart';

class BlocProvider<T extends Bloc> extends InheritedWidget {
  final T value;
  BlocProvider({
    super.key,
    required super.child,
    required T Function() create,
  }) : value = create();

  const BlocProvider.value({
    super.key,
    required super.child,
    required this.value,
  });

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T>? provider =
        context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>();

    if (provider == null) {
      if (kDebugMode) {
        print("BlocProvider of type [$T] not found in context");
        print(
            "Make sure your BlocProvider.of() call is inside the build method of a widget that is an ancestor of the BlocProvider");
        print("Or wrap your widget inside a builder.");
        print("For example:");
        print("""BlocProvider(
            create: () => CounterBloc(),
            child: Builder(
              builder: (context) {
                return Column();
              },
            ),
          ),""");
      }

      throw Exception("BlocProvider of type [$T] not found in context");
    }
    return provider.value;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
