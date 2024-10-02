import 'package:flutter_custom_bloc/flutter_custom_bloc.dart';
import 'package:example/counter_example/bloc/counter_bloc.dart';
import 'package:example/counter_example/bloc/counter_state.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  CounterBloc conuterBloc = CounterBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider.value(
            value: conuterBloc,
            child: Builder(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      BlocProvider.of<CounterBloc>(context).increment();
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                  const SizedBox(width: 10),
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Text("${state.countValue}");
                    },
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).decrement();
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                ],
              );
            }),
          ),
          BlocProvider.value(
            value: conuterBloc,
            child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            BlocProvider.of<CounterBloc>(context).increment();
                          },
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                        const SizedBox(width: 10),
                        BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, state) {
                            return Text("${state.countValue}");
                          },
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context).decrement();
                          },
                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                      ],
                    ),
                    CustomTextButton(
                      text: "Reset State",
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context).reset();
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
