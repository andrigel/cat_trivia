import 'package:cat_trivia/components/facts_list_page/facts_list.dart';
import 'package:cat_trivia/components/home_page/home.dart';
import 'package:cat_trivia/helpers/api/api.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final RestClient client;
  const MyApp({Key? key, required this.client}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(client: client), routes: {
      '/home': (context) => Home(client: client),
      '/facts_list': ((context) => const FactsList())
    },
    debugShowCheckedModeBanner: false
    );
  }
}
