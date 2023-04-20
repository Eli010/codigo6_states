import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:codigo6_states/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //PRROVIDER DE POSTPROVIDER
    //recibimos información para eso cambiaremos listen= false
    PostProvider postProvider =
        Provider.of<PostProvider>(context, listen: false);
    //obtiene informacion y notificamos
    postProvider.getPost2();
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
      //USAREMOS NUESTRO APISERVICE- Y PROVIDER
      body: Consumer<PostProvider>(
        builder: (context, value, _) {
          return Text(postProvider.posts.toString());
        },
      ),
    );
  }
}
