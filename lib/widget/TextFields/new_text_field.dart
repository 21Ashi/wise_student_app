import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/Screens/LogIn/phone_number.dart';
import 'package:wise_student_app/Screens/onbloardscreen/onboard_main.dart';
import 'package:wise_student_app/generated/l10n.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    Key? skey,
    required this.controller,
    required this.hint,
    required this.textInputType,
    this.focusNode,
    this.validator,
    this.maxLength,
    this.obscureText,
    this.onChanged,
    this.prefixIcon,
    this.formatter,
    this.typeInput,
    this.suffix,
    this.suffixIcon,
    this.color,
    this.withWhiteBorder,
    this.maxLine,
    this.focus,
    this.textAlign,
    this.textInputAction,
    this.iconSize,
    this.isDense,
    this.onFieldSubmitted,
    this.showErrorBorder = false, // Add showErrorBorder parameter
  });

  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String hint;
  final TextInputType textInputType;
  final Widget? prefixIcon, suffix, suffixIcon;
  final int? maxLength;
  final bool? obscureText;
  final bool? iconSize;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? formatter;
  final String? typeInput;
  final bool? withWhiteBorder;
  final Color? color;
  final int? maxLine;
  final bool? focus;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final bool? isDense;
  final Function(String)? onFieldSubmitted;
  final bool showErrorBorder; // New parameter to control error border

  @override
  _MainTextFieldState createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  bool _hasError = false; // Track whether the text field has an error

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 300,
      ),
      autocorrect: true,
      showCursor: true,
      cursorColor: Colors.black,
      focusNode: widget.focusNode,
      inputFormatters: widget.formatter,
      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator ??
          (value) {
            setState(() {
              // Check for validation errors
              _hasError = value == null || value.isEmpty || !isValid(value);
            });
            if (_hasError) {
              return 'Invalid input'; // Return an error message if validation fails
            }
            return null;
          },
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (value) {
        if (widget.textInputAction == TextInputAction.done &&
            widget.textInputAction != TextInputAction.next) {
          FocusScope.of(context).unfocus();
        }
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
      },
      maxLines: widget.maxLine ?? 1,
      textAlign: widget.textAlign ?? TextAlign.start,
      style: const TextStyle(
        fontSize: 16,
      ),
      obscureText: widget.obscureText ?? false,
      mouseCursor: MouseCursor.defer,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 16,
          bottom: 16,
        ),
        isDense: widget.isDense ?? false,
        errorMaxLines: 4,
        suffixIcon: widget.suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: _hasError && widget.showErrorBorder
                ? Colors
                    .red // Use red color for error border if showErrorBorder is true
                : Colors.grey.withOpacity(0.6),
            width: 1.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.6),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 10,
        ),
        fillColor: Colors.white,
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }

  // Function to validate input
  bool isValid(String input) {
    // Implement your validation logic here
    // For example, check if the input is a valid email address
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(input);
  }
}

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({super.key});

  @override
  _MyLoginFormState createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController universityid = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isChecked = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (errorMessage != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          MainTextField(
            controller: universityid,
            hint: S.of(context).Uniemail,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          MainTextField(
            controller: password,
            hint: S.of(context).Password,
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                activeColor: const Color(0xff4B62A9),
                onChanged: (newBool) {
                  setState(() {
                    isChecked = newBool!;
                  });
                },
              ),
              Text(
                S.of(context).RememberMe,
                style: GoogleFonts.karma(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.to(() => const Forgetpassword());
                },
                child: Text(
                  S.of(context).ForgetPassword,
                  style: GoogleFonts.karma(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      errorMessage = null;
                    });

                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: universityid.text, password: password.text)
                          .then((value) => Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return Onboard();
                              }), (route) => false));
                    } on FirebaseAuthException catch (e) {
                      debugPrint(e.code);
                      setState(() {
                        switch (e.code) {
                          case 'invalid-credential':
                            errorMessage = 'Invalid email or password.';
                            break;
                          case 'wrong-password':
                            errorMessage =
                                'Incorrect password. Please try again.';
                            break;
                          case 'user-not-found':
                            errorMessage = 'No user found with this email.';
                            break;
                          case 'invalid-email':
                            errorMessage = 'Invalid email format.';
                            break;
                          default:
                            errorMessage =
                                'An error occurred. Please try again.';
                        }
                      });
                    }
                  }
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff4B62A9),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).login,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
