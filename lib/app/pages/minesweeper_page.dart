import 'package:flutter/material.dart';

class MinesWeeperPage extends StatelessWidget {
  const MinesWeeperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campo minado'),
      ),
      body: Container(
        child: const Text('Board'),
      ),
    );
  }
}
