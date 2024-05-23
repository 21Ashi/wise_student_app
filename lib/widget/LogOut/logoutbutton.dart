import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Library/shoppingcart.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/main.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, Key? skey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  S.of(context).Close,
                  style: GoogleFonts.karma(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Clear the shopping cart when logging out
                  ShoppingCartController.instance.clearCart();

                  // Navigate to the login screen and remove all previous routes
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPage(
                              title: '',
                            )),
                    (route) => false,
                  );
                },
                child: Text(
                  S.of(context).LogoutButton,
                  style: GoogleFonts.karma(
                    color: Colors.red,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            title: Center(
              child: Text(
                S.of(context).LogoutText,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 80,
        height: 35,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 3), blurRadius: 4, color: Colors.black38)
          ],
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            S.of(context).LogoutButton,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
