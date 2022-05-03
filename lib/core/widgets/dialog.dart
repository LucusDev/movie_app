import 'package:flutter/material.dart' as mi;
import 'package:movie_app/core/constant.dart';

class Dialog extends mi.StatelessWidget {
  final String message;
  final mi.VoidCallback onOK;
  const Dialog({
    mi.Key? key,
    required this.message,
    required this.onOK,
  }) : super(key: key);

  @override
  mi.Widget build(mi.BuildContext context) {
    return mi.Container(
      color: Constant.primaryColorLight.withOpacity(0.3),
      child: mi.AlertDialog(
        actions: [
          mi.ElevatedButton(
            child: const mi.Text("Ok"),
            onPressed: onOK,
          )
        ],
        content: mi.Text(message),
      ),
    );
  }
}
