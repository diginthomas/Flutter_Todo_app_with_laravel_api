import 'package:flutter/material.dart';
import 'package:todowithlist/Screens/Insert.dart';
import 'package:todowithlist/Screens/view.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => InsertForm(),
             '/view':(context)=>View()
      },
      theme: ThemeData.dark(),
    );
  }
}
