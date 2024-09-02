import 'package:flutter/material.dart';

class AlertDialogContext {
  final BuildContext context;

  // Construtor que aceita o contexto
  AlertDialogContext(this.context);

  void showAlertDialog({
    required Widget alertTitle,
    required Widget alertContent,
    List<Widget>? alertActions,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: alertTitle,
        content: alertContent,
        actions: alertActions ??
            [
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text("Aceitar"),
              )
            ],
        elevation: 24.0,
      ),
    );
  }
}
