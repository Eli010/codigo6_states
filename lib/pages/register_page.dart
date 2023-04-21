import 'package:codigo6_states/pages/register_bloc.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterBloc registerBloc = RegisterBloc();

  @override
  void dispose() {
    super.dispose();
    registerBloc.dispose();
  }

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
              StreamBuilder(
                stream: registerBloc.stream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(fontSize: 40.0),
                    );
                  }
                  return const Text(
                    "0",
                    style: TextStyle(fontSize: 40.0),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  registerBloc.addCounter(IncrementEvent(1));
                },
                child: const Text("Registrar"),
              )
            ],
          ),
        ));
  }
}
