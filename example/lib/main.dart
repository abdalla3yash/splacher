import 'package:flutter/material.dart';
import 'package:splacher/splacher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splacher',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplacherWidget(),
    );
  }
}

class SplacherWidget extends StatelessWidget {
  const SplacherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Splacher(
      pages: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xff7fc8c0),
            child: Center(
                child: Image.asset("assets/img3.png", fit: BoxFit.fitWidth))),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xfff0846a),
            child: Center(
                child: Image.asset("assets/img2.jpg", fit: BoxFit.fitWidth))),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xfffde500),
            child: Center(
                child: Image.asset("assets/img1.jpg", fit: BoxFit.fitWidth))),
      ],
      activeColor: Colors.white,
      inActiveColor: Colors.white70,
      onIntroCompleted: () {
        Navigator.of(context).pushReplacementNamed('/location');
      },
    ));
  }
}
