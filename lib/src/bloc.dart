import 'dart:async';
import 'package:flutter_custom_bloc/src/bloc_provider.dart';
import 'package:flutter/material.dart';

part 'bloc_builder.dart';

abstract class Bloc<S> {
  final S _initialState;
  S state;

  Bloc(this.state)
      : _controller = StreamController<S>.broadcast(),
        _initialState = state {
    if (S == dynamic) {
      throw Exception('Please provide a type for Bloc');
    }
  }

  final StreamController<S> _controller;

  void emit(S state) {
    if (this.state != state) {
      this.state = state;
      _controller.add(state);
    }
  }

  dispose() {
    _controller.close();
  }

  reset() {
    _controller.add(_initialState);
  }
}
