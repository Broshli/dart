import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counting App"),
      ),
      body: Center(
        child: Container(
          child: const Text("Hello Sir."),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
