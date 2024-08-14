import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vet_plus/configs/pages_configs.dart';
import 'package:vet_plus/pages/login_page.dart';
import 'package:vet_plus/navigation/router.dart';
import 'package:vet_plus/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vet Plus',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 79, 191, 139)),
          primaryColor: const Color.fromARGB(255, 79, 191, 139),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 79, 191, 139),
          fontFamily: 'Kadawa',
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.black),
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.red),
            headlineLarge: TextStyle(color: Colors.white),
          )),
      home: const MyHomePage(title: 'Vet Plus App Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    PagesConfigs config = PagesConfigs(context);

    Navigation router = Navigation();

    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
          image: AssetImage("assets/main.jpg"),
          fit: BoxFit.cover,
        ))),
        Center(
            child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(153, 79, 191, 139),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              height: config.viewHeight * 0.87,
              width: config.viewWidth * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo_interno.png"))),
                    height: 350,
                    width: config.viewWidth,
                  ),
                  SizedBox(
                    width: config.viewWidth * 0.8,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () => router.push(context, const LoginPage()),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          elevation: 10,
                          side: const BorderSide(width: 4, color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        "LOGIN",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.viewHeight * 0.06,
                  ),
                  SizedBox(
                    width: config.viewWidth * 0.8,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () =>
                          router.push(context, const RegisterPage()),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 10,
                          side: const BorderSide(width: 4, color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        "REGISTER",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ]),
    );
  }
}
