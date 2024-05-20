import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/main.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordTextField extends StatefulWidget {
  const NewPasswordTextField({super.key});

  @override
  State<NewPasswordTextField> createState() => _NewPasswordTextFieldState();
}

class _NewPasswordTextFieldState extends State<NewPasswordTextField> {
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  bool _isvisible = false;
  bool _isvisible2 = false;
  bool _isPasswordSixCharacters = false;
  bool _isPasswordOneNumber = false;
  bool _isPasswordOneSpecial = false;
  bool _isPasswordMatched = false;

  void onPasswordChange(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final letterRegex = RegExp(r'[!@#\$&*~]');
    setState(() {
      _isPasswordSixCharacters = password.length >= 6;
      _isPasswordOneNumber = numericRegex.hasMatch(password);
      _isPasswordOneSpecial = letterRegex.hasMatch(password);
    });
  }

  void onPasswordChange2(String password) {
    setState(() {
      if (_confirmpassword.text.isNotEmpty) {
        _isPasswordMatched = _newpassword.text == _confirmpassword.text;
      }
    });
  }

  bool get isValid =>
      _isPasswordSixCharacters &&
      _isPasswordOneNumber &&
      _isPasswordOneSpecial &&
      _isPasswordMatched;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextField(
            onChanged: (password) => onPasswordChange(password),
            obscureText: !_isvisible,
            controller: _newpassword,
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
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: S.of(context).NewPassword,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey[700]),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            cursorColor: Colors.blue,
          ),
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
                color: _isPasswordSixCharacters
                    ? Colors.green
                    : Colors.transparent,
                border: _isPasswordSixCharacters
                    ? Border.all(color: Colors.transparent)
                    : Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(S.of(context).Constraint1,
                style: GoogleFonts.karma(fontSize: 12, color: Colors.grey[800]))
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
                border: _isPasswordOneNumber
                    ? Border.all(color: Colors.transparent)
                    : Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(S.of(context).Constraint2,
                style: GoogleFonts.karma(fontSize: 12, color: Colors.grey[800]))
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
                color:
                    _isPasswordOneSpecial ? Colors.green : Colors.transparent,
                border: _isPasswordOneSpecial
                    ? Border.all(color: Colors.transparent)
                    : Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(S.of(context).Constraint3,
                style: GoogleFonts.karma(fontSize: 12, color: Colors.grey[800]))
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: TextField(
            onChanged: (password) => onPasswordChange2(password),
            obscureText: !_isvisible2,
            controller: _confirmpassword,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isvisible2 = !_isvisible2;
                  });
                },
                icon: _isvisible2
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: S.of(context).ConfirmPassword,
              hintStyle: const TextStyle(fontSize: 14),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            cursorColor: Colors.blue,
          ),
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
                color: _isPasswordMatched ? Colors.green : Colors.transparent,
                border: _isPasswordMatched
                    ? Border.all(color: Colors.transparent)
                    : Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(S.of(context).Constraint4,
                style: GoogleFonts.karma(fontSize: 12, color: Colors.grey[800]))
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color?>((states) {
                if (_isPasswordMatched) {
                  return const Color(0xff4B62A9);
                }
                return Colors.grey;
              }),
            ),
            onPressed: isValid
                ? () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MainPage(
                        title: '',
                      );
                    }));
                  }
                : null,
            child: Text(
              S.of(context).ConfirmButton,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
