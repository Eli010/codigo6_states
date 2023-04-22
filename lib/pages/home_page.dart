import 'package:codigo6_states/cubit/post/post_cubit.dart';
import 'package:codigo6_states/cubit/post/post_state.dart';
import 'package:codigo6_states/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //usamos nuestros cubit
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PostCubit>().getPostsData();
    });
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
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostInitState || state is PostLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is PostSuccedState) {
            List data = state.posts;
            return ListTile(
              title: Text(data.toString()),
              subtitle: Text("Descripciòn del item"),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
