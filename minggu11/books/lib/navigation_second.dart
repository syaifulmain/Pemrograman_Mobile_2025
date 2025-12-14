import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Page')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, Colors.red);
              },
              child: const Text('Red Color'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, Colors.green);
              },
              child: const Text('Green Color'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, Colors.blue);
              },
              child: const Text('Blue Color'),
            ),
          ],
        ),
      ),
    );
  }
}