import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ExampleProvider exampleProvider = Provider.of<ExampleProvider>(context);
    PersonProvider personProvider = Provider.of<PersonProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text("Listado de item"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ));
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: personProvider.people.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(personProvider.people[index]),
              subtitle: const Text("Descripciòn del item"),
            );
          },
          // children: [

          //   Text(exampleProvider.contador.toString()
          //       // context.watch<ExampleProvider>().contador.toString(),
          //       ),
          // ],
        ));
  }
}
