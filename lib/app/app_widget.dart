import 'package:flutter/material.dart';
import 'package:flutter_minesweeper/app/pages/minesweeper_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Minesweeper game',
      debugShowCheckedModeBanner: false,
      home: MinesWeeperPage(),
    );
  }
}
