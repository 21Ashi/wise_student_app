import 'package:flutter/material.dart';

void main() {
  runApp(const Password());
}

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomPasswordField(
            controller: passwordController,
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode:
          AutovalidateMode.onUserInteraction, // Validate on user interaction
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: widget.controller,
          obscureText: _isObscure,
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.yellow),
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: IconButton(
              icon: Icon(_isObscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
