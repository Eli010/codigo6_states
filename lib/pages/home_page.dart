import 'package:codigo6_states/bloc/posts/post_bloc.dart';
import 'package:codigo6_states/bloc/posts/post_event.dart';
import 'package:codigo6_states/bloc/posts/post_state.dart';
import 'package:codigo6_states/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Listado de item"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => RegisterPage(),
          //     ));
          BlocProvider.of<PostBloc>(context).add(GetPostEvent());
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Nombre de item"),
            subtitle: Text("Descripciòn del item"),
          ),
          ListTile(
            title: Text("Nombre de item"),
            subtitle: Text("Descripciòn del item"),
          ),
          ListTile(
            title: Text("Nombre de item"),
            subtitle: Text("Descripciòn del item"),
          ),
          BlocBuilder<PostBloc, PostState>(
            builder: (BuildContext context, PostState state) {
              return Text(
                state.toString(),
                style: TextStyle(fontSize: 30),
              );
            },
          )
        ],
      ),
    );
  }
}
