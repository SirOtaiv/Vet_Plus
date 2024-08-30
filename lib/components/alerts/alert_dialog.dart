import 'package:flutter/material.dart';

class AlertDialogContext {
  final BuildContext context;

  // Construtor que aceita o contexto
  AlertDialogContext(this.context);

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Alert De teste'),
        content: const Text('You are registered'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text("Aceitar"),
          ),
        ],
        elevation: 24.0,
      ),
    );
  }
}
