import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('/');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'asset/img/sbg.jpeg',
          ),
        ),
      ),
      child: const Scaffold(
        body: Center(
            child: Text(
          'Galaxy App',
          style: TextStyle(color: Colors.white,fontSize: 40),
        )),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
