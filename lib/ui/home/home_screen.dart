import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home',
        style: Theme.of(context).textTheme.headlineLarge,),
      ),
    );
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=0d111f8f92154ebcaa4c62b58dfe4158
 */