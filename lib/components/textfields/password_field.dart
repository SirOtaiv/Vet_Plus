import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final double? iconsSize;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String>? onChange;

  const PasswordField({
    Key? key,
    required this.obscureText,
    this.hintText,
    this.iconsSize,
    this.height,
    required this.width,
    required this.onPressed,
    this.validator,
    this.onChange,
  }) : super(key: key);

  //  String? validateConfirmPassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Por favor, confirme sua senha';
  //   }
  //   if (value != "") {
  //     setState(() {
  //       passwordsMatch = false;
  //     });
  //     return 'As senhas não coincidem';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        obscureText: !obscureText,
        decoration: InputDecoration(
          hintText: "Insira sua senha novamente",
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            size: 32,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              size: 32,
            ),
            onPressed: onPressed,
          ),
          errorText: 'As senhas não coincidem',
        ),
        style: const TextStyle(color: Colors.black, fontSize: 20),
        keyboardType: TextInputType.visiblePassword,
        validator: validator,
        onChanged: onChange,
      ),
    );
  }
}
