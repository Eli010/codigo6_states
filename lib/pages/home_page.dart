import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:codigo6_states/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //MEJORAREMOS NUESTRO CODIGO CON PROVIDER MOSTRANDO DOS PANTALLA INFO
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PostProvider postProvider =
          Provider.of<PostProvider>(context, listen: false);
      postProvider.getPost2();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<PostProvider>(
        builder: (context, provider, _) {
          return Text(provider.posts.toString());
        },
      ),
    );
  }
}
