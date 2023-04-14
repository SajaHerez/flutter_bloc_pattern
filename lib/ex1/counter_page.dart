import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'button_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(" Counter bloc"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<CounterBloc, CounterState>(
                listenWhen: (previous, current) {
                  print(previous);
                  print(current);
                  print(previous != current);
                  return (previous != current);
                },
                listener: (context, state) {
                  print("new state emmitted by the CounterBloc");
                },
                child: const Text("BlocListener"),
              ),
              BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text(
                    "0",
                    style: TextStyle(fontSize: 30),
                  );
                } else if (state is CounterValueChanged) {
                  return Text(
                    state.counter.toString(),
                    style: const TextStyle(fontSize: 30),
                  );
                }
                return const SizedBox();
              }),
            ],
          ),
        ),
        floatingActionButton: const ButtonsWidget());
  }
}
