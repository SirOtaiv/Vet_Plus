import 'package:flutter/material.dart';
import 'package:vet_plus/components/alerts/alert_dialog.dart';
import 'package:vet_plus/components/checkbox/checkbox_tile.dart';
import 'package:vet_plus/components/textfields/password_field.dart';
import 'package:vet_plus/configs/pages_configs.dart';
import 'package:vet_plus/navigation/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  bool isPersonRemembered = false;

  @override
  Widget build(BuildContext context) {
    PagesConfigs screenConfig = PagesConfigs(context);
    Navigation router = Navigation();
    AlertDialogContext dialogContext = AlertDialogContext(context);

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
                            height: 200,
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
                                  size: 32,
                                ),
                                contentPadding: EdgeInsets.only(top: 12),
                              ),
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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
                          PasswordField(
                            obscureText: isPasswordVisible,
                            hintText: "Insira sua Senha novamente",
                            isPasswordValidated: false,
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            width: screenConfig.viewWidth * 0.8,
                          ),
                          SizedBox(
                            height: 40,
                            width: screenConfig.viewWidth * 0.8,
                            child: CheckboxTile(
                              title: const Text(
                                "Permanecer conectado",
                                style: TextStyle(fontSize: 18),
                              ),
                              iconSize: 30,
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
                          SizedBox(
                            height: screenConfig.viewHeight * 0.08,
                          ),
                          Container(
                              width: screenConfig.viewWidth * 0.8,
                              height: 60,
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
                                onPressed: () {
                                  dialogContext.showAlertDialog(
                                    alertTitle: const Text("Login User"),
                                    alertContent: const Text(
                                        "You are logged, enjoy the App :)"),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: Text(
                                  "ENTRAR",
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
                              height: 60,
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
