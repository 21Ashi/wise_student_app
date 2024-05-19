import 'package:flutter/material.dart';

void main() {
  runApp(const Email());
}

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomEmailField(
            controller: emailcontroller,
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
        ),
      ),
    );
  }
}

class CustomEmailField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const CustomEmailField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomEmailField> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          )),
    );
  }
}
