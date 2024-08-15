import 'package:flutter/material.dart';
import 'package:vet_plus/components/widgets/checkbox_tile.dart';
import 'package:vet_plus/configs/pages_configs.dart';
import 'package:vet_plus/navigation/router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPasswordVisible = false;
  bool isPersonRemembered = false;
  String password = '';
  String confirmPassword = '';
  bool passwordsMatch = true;

  // Função para validar a senha, em construção...
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma senha';
    }
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return 'A senha deve conter pelo menos uma letra';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'A senha deve conter pelo menos um número';
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'A senha deve conter pelo menos um caractere especial';
    }
    return null;
  }

  // Função para validar a confirmação da senha
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme sua senha';
    }
    if (value != password) {
      setState(() {
        passwordsMatch = false;
      });
      return 'As senhas não coincidem';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    PagesConfigs screenConfig = PagesConfigs(context);
    Navigation router = Navigation();

    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      height: screenConfig.viewHeight * 0.87,
                      width: screenConfig.viewWidth * 0.90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/vetplustexticon.png"))),
                            height: 160,
                            width: screenConfig.viewWidth * 0.8,
                          ),
                          Container(
                            width: screenConfig.viewWidth * 0.8,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(
                            width: screenConfig.viewWidth * 0.8,
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "Insira seu melhor email",
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  size: 35,
                                ),
                              ),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: screenConfig.viewWidth * 0.8,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Senha",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(
                            width: screenConfig.viewWidth * 0.8,
                            child: TextFormField(
                              obscureText: !isPasswordVisible,
                              decoration: InputDecoration(
                                hintText: "Insira sua senha",
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  size: 35,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                ),
                                errorText: passwordsMatch
                                    ? null
                                    : 'As senhas não coincidem',
                              ),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25),
                              keyboardType: TextInputType.visiblePassword,
                              validator: validatePassword,
                              onChanged: (String value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: screenConfig.viewWidth * 0.8,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Senha Novamente",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(
                            width: screenConfig.viewWidth * 0.8,
                            child: TextFormField(
                              obscureText: !isPasswordVisible,
                              decoration: InputDecoration(
                                hintText: "Insira sua senha novamente",
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  size: 35,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                ),
                                errorText: passwordsMatch
                                    ? null
                                    : 'As senhas não coincidem',
                              ),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25),
                              keyboardType: TextInputType.visiblePassword,
                              validator: validateConfirmPassword,
                              onChanged: (String value) {
                                setState(() {
                                  confirmPassword = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 60,
                            width: screenConfig.viewWidth * 0.8,
                            child: CheckboxTile(
                              title: const Text(
                                "Permanecer conectado",
                                style: TextStyle(fontSize: 28),
                              ),
                              iconSize: 32,
                              value: isPersonRemembered,
                              onChanged: (bool? value) {
                                setState(() {
                                  isPersonRemembered = value!;
                                });
                              },
                              selected: isPersonRemembered,
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor:
                                  const Color.fromARGB(255, 79, 191, 139),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                              width: screenConfig.viewWidth * 0.8,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 193, 193, 193),
                                        blurRadius: 5,
                                        offset: Offset(0, 5))
                                  ],
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 210, 140, 140),
                                    Color.fromARGB(255, 214, 134, 28)
                                  ])),
                              child: ElevatedButton(
                                onPressed: () => {},
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: Text(
                                  "REGISTRAR",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(color: Colors.black),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                            width: screenConfig.viewWidth,
                          ),
                          Container(
                              width: screenConfig.viewWidth * 0.8,
                              height: 70,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 193, 193, 193),
                                        blurRadius: 5,
                                        offset: Offset(0, 5))
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 182, 42, 54),
                                    Color.fromARGB(255, 128, 26, 35)
                                  ])),
                              child: ElevatedButton(
                                onPressed: () => router.back(context),
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: Text(
                                  "CANCELAR",
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              )),
                        ],
                      )),
                )
              ],
            )));
  }
}
