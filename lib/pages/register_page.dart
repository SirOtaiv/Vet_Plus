import 'package:flutter/material.dart';
import 'package:vet_plus/configs/pages_configs.dart';
import 'package:vet_plus/navigation/router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    PagesConfigs config = PagesConfigs(context);

    Navigation router = Navigation();

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              height: config.viewHeight * 0.87,
              width: config.viewWidth * 0.90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("TELA DE REGISTRO"),
                  Container(
                      width: config.viewWidth * 0.8,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 193, 193, 193),
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
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(
                          "REGISTRAR",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      )),
                  SizedBox(
                    height: 40,
                    width: config.viewWidth,
                  ),
                  Container(
                      width: config.viewWidth * 0.8,
                      height: 70,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 193, 193, 193),
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
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(
                          "CANCELAR",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      )),
                ],
              )),
        )
      ],
    ));
  }
}
