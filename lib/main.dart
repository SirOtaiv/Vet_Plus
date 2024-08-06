import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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
              titleLarge: TextStyle(fontSize: 32, color: Colors.white),
              bodyLarge: TextStyle(fontSize: 24, color: Colors.white))),
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
    final double viewHeigh = MediaQuery.of(context).size.height;
    final double viewWidth = MediaQuery.of(context).size.width;

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
              height: viewHeigh * 0.87,
              width: viewWidth * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo_interno.png"))),
                    height: 350,
                    width: viewWidth,
                  ),
                  SizedBox(
                    width: viewWidth * 0.8,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          elevation: 25,
                          side: const BorderSide(width: 5, color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        "LOGIN",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: viewHeigh * 0.06,
                  ),
                  SizedBox(
                    width: viewWidth * 0.8,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 25,
                          side: const BorderSide(width: 5, color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        "REGISTER",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  )
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
