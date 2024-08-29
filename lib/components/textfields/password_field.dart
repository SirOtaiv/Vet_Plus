import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final double? iconsSize;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool? isPasswordValidated;
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
    this.fontSize,
    this.isPasswordValidated = true,
    this.validator,
    this.onChange,
  }) : super(key: key);

  String? validatePassword(String? value) {
    if (value != null && isPasswordValidated!) {
      List<String> requirements = [];

      if (value.length < 8) {
        requirements.add('8 caracteres');
      }
      if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
        requirements.add('uma letra');
      }
      if (!RegExp(r'[0-9]').hasMatch(value)) {
        requirements.add('um número');
      }
      if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
        requirements.add('um símbolo');
      }

      if (requirements.isEmpty) {
        return null;
      }

      String validateMessage =
          'Senha precisa ter pelo menos:\n${requirements.join(', ')}';
      return validateMessage;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        obscureText: !obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              size: iconsSize ?? 30,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                size: iconsSize ?? 30,
              ),
              onPressed: onPressed,
            ),
            contentPadding: const EdgeInsets.only(top: 14)
            // errorText: 'As senhas não coincidem',
            ),
        style: TextStyle(color: Colors.black, fontSize: fontSize ?? 17),
        keyboardType: TextInputType.visiblePassword,
        validator: (valid) => validatePassword(valid),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChange,
      ),
    );
  }
}
