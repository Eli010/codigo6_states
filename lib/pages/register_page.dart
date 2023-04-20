import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:codigo6_states/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController registerCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PostProvider postProvider =
        Provider.of<PostProvider>(context, listen: false);
    // ExampleProvider exampleProvider =
    // Provider.of<ExampleProvider>(context);
    PersonProvider personProvider = Provider.of<PersonProvider>(context);
    print("BUILDDDDDDDDDDDDDDDDDD!!!!!");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text("Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: registerCtrl,
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  // exampleProvider.cambiarContador(21554);
                  personProvider.addPersons(registerCtrl.text);
                },
                child: const Text("Registrar"),
              ),
              //Para solo estar escuchando en un solo lugar
              Consumer<ExampleProvider>(
                builder: (context, provider, _) {
                  return Text(provider.contador.toString());
                },
              ),
              Consumer<PostProvider>(
                builder: (context, value, _) {
                  return Text(postProvider.posts.toString());
                },
              ),
              // Text( exampleProvider.contador.toString())
            ],
          ),
        ));
  }
}
