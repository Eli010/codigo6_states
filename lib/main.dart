import 'package:codigo6_states/pages/home_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PersonProvider()),
          ChangeNotifierProvider(create: (context) => ExampleProvider())
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Provider App',
          home: HomePage(),
        ));
  }
}
