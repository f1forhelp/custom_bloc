```markdown
# Flutter Custom BLoC Library

A simple and reusable implementation of the BLoC (Business Logic Component) pattern for Flutter applications. This library provides a way to manage state and business logic using streams, making it easier to separate UI from business logic.

## Features

- **Stream-based State Management**: Utilizes Dart's `Stream` to manage state updates in a reactive manner.
- **BlocProvider**: An InheritedWidget to provide BLoC instances to the widget tree.
- **BlocBuilder**: A widget to rebuild the UI in response to state changes.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_custom_bloc:
```

Replace `yourusername` with your GitHub username.

## Usage

### Creating a Bloc

Create a class that extends the `Bloc` class:

```dart
import 'package:flutter_custom_bloc/flutter_custom_bloc.dart';

class CounterBloc extends Bloc<int> {
  CounterBloc() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
```

### Providing the Bloc

Wrap your widget tree with `BlocProvider` to provide the BLoC instance:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_custom_bloc/flutter_custom_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: () => CounterBloc(),
        child: CounterScreen(),
      ),
    );
  }
}
```

### Building the UI with BlocBuilder

Use `BlocBuilder` to build your UI based on the current state of the BLoC:

```dart
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Center(
            child: Text('Count: $state'),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              final bloc = BlocProvider.of<CounterBloc>(context);
              bloc.increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              final bloc = BlocProvider.of<CounterBloc>(context);
              bloc.decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
```

## API Reference

### Bloc Class

- **Constructor**: `Bloc(S state)` - Initializes the BLoC with an initial state.
- **emit(S state)**: Emits a new state if it's different from the current state.
- **dispose()**: Closes the stream controller to free up resources.
- **reset()**: Resets the BLoC to its initial state.

### BlocProvider Class

- **Constructor**: `BlocProvider({Key? key, required Widget child, required T Function() create})` - Creates a new BLoC instance and provides it to the widget tree.
- **of<T extends Bloc>(BuildContext context)**: Returns the BLoC instance of type `T` from the widget tree.

### BlocBuilder Class

- **Constructor**: `BlocBuilder({Key? key, required Widget Function(BuildContext context, S state) builder})` - Rebuilds the UI when the BLoC emits a new state.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
```