import 'package:flutter/material.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({Key? key}) : super(key: key);
  @override
  State<AIChatScreen> createState() => _AIChatState();
}

class _AIChatState extends State<AIChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('AI Chat Now'),
      ),
    );
  }
}
