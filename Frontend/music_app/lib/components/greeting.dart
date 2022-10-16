import 'package:flutter/material.dart';

class Greeting extends StatefulWidget {
  final String greeting;

  const Greeting({super.key, required this.greeting});

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Hello User!',
        style: TextStyle(fontSize: 40, color: Colors.green),
      ),
    );
  }
}
