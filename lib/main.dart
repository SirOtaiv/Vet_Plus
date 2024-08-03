import 'dart:ui';

import 'package:flutter/material.dart';

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
      ),
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
  int _counter = 0;

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(153, 79, 191, 139),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo_interno.png"),
                            fit: BoxFit.contain)),
                  ),
                  Text("JJJJJJJJJJJ")
                ],
              ),
            ),
          ),
        )),
      ]),

      // persistentFooterButtons: [
      //   FloatingActionButton(
      //     onPressed: _resetCounter,
      //     tooltip: 'Increment',
      //     child: const Icon(Icons.replay_outlined),
      //   ),
      //   FloatingActionButton(
      //     onPressed: _incrementCounter,
      //     tooltip: 'Increment',
      //     child: const Icon(Icons.add),
      //   ),
      // ],
    );
  }
}
