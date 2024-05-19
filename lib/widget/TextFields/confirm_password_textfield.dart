import 'package:flutter/material.dart';

class ConfirmPassowrdTextField extends StatefulWidget {
  const ConfirmPassowrdTextField({Key? key}) : super(key: key);

  @override
  State<ConfirmPassowrdTextField> createState() => _NewPasswordTextFieldState();
}

class _NewPasswordTextFieldState extends State<ConfirmPassowrdTextField> {
  final TextEditingController _passwordValidation = TextEditingController();

  bool _isvisible = false;
   bool _isPasswordSixCharacters = false;
    bool _isPasswordOneNumber = false;
    bool _isPasswordOneSpecial = false;
  onpasswordchange(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final letterRegex = RegExp(r'[!@#\$&*~]');
    setState(() {
      _isPasswordSixCharacters = false;
      if(password.length >= 6) {
        _isPasswordSixCharacters = true;
      }
      _isPasswordOneNumber = false;
      if(numericRegex.hasMatch(password)) {
        _isPasswordOneNumber = true;
      }
      _isPasswordOneSpecial = false;
      if(letterRegex.hasMatch(password)){
        _isPasswordOneSpecial = true;
      }
      
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (password) => onpasswordchange(password),
          obscureText: !_isvisible,
          controller: _passwordValidation,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isvisible = !_isvisible;
                });
              },
              icon: _isvisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintText: 'New Password',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
          cursorColor: Colors.blue,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AnimatedContainer(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 500),
              width: 15,
              height: 15,
              
              decoration: BoxDecoration(
                  color: _isPasswordSixCharacters ? Colors.green : Colors.transparent,
                  border: _isPasswordSixCharacters ? Border.all(color: Colors.transparent) : Border.all(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  )),
              child: const Center(
                child: Icon(Icons.check, color: Colors.white, size: 15),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Contains atleast 6 Characters')
          ],
        ),
        Row(
          children: [
            AnimatedContainer(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 500),
              width: 15,
              height: 15,
              
              decoration: BoxDecoration(
                  color: _isPasswordOneNumber ? Colors.green : Colors.transparent,
                  border: _isPasswordOneNumber ? Border.all(color: Colors.transparent) : Border.all(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  )),
              child: const Center(
                child: Icon(Icons.check, color: Colors.white, size: 15),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Contains atleast 1 number')
          ],
        ),
        Row(
          children: [
            AnimatedContainer(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 500),
              width: 15,
              height: 15,
              
              decoration: BoxDecoration(
                  color: _isPasswordOneSpecial ? Colors.green : Colors.transparent,
                  border: _isPasswordOneSpecial ? Border.all(color: Colors.transparent) : Border.all(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  )),
              child: const Center(
                child: Icon(Icons.check, color: Colors.white, size: 15),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Contains atleast 1 special character')
          ],
        )
      ],
    );
  }
}
