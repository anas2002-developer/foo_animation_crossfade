import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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


  //for toggle
  bool flag = true;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4),() {
      crossFade();
    },);

  }

  void crossFade() {
    setState(() {
      flag = false;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child:
              AnimatedCrossFade(
                duration: Duration(seconds: 2),
                firstChild: CircleAvatar(radius: 90, backgroundColor: Colors.deepPurpleAccent.shade100,),
                secondChild: Icon(Icons.gesture, color: Colors.deepPurpleAccent, size: 50,),

                sizeCurve: Curves.bounceOut,
                firstCurve: Curves.slowMiddle,
                secondCurve: Curves.bounceInOut,

                crossFadeState: flag ? CrossFadeState.showFirst :CrossFadeState.showSecond,
              ),

        )
    );
  }

}
