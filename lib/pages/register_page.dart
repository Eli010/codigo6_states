import 'package:codigo6_states/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text("Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const TextField(),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  print("wwwwwww $state");
                  switch (state.runtimeType) {
                    case CounterInitState:
                      int value = (state as CounterInitState).data;
                      return Text(
                        value.toString(),
                        style: TextStyle(fontSize: 40),
                      );
                    case IncrementState:
                      int value = (state as IncrementState).data;
                      return Text(
                        value.toString(),
                        style: TextStyle(fontSize: 40),
                      );
                      break;
                    default:
                      return Center();
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                child: const Text("Registrar"),
              )
            ],
          ),
        ));
  }
}
