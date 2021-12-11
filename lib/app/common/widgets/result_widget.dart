import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? winner;
  final Function onRestart;

  const ResultWidget({
    Key? key,
    required this.winner,
    required this.onRestart,
  }) : super(key: key);

  Color? _getColor() {
    if (winner == null) {
      return Colors.yellow;
    } else if (winner!) {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData _getIcon() {
    if (winner == null) {
      return Icons.sentiment_satisfied;
    } else if (winner!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: () => onRestart,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
