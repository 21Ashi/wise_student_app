import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Chat/chat_main.dart';
import 'package:wise_student_app/Screens/Library/library_main.dart';
import 'package:wise_student_app/Screens/News/news_main.dart';
import 'package:wise_student_app/Screens/Profile/student_profile_screen.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/provider/provider_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavBar(initialIndex: 0), // Pass the initial index here
    );
  }
}

class NavBar extends StatefulWidget {
  final int initialIndex; // Add this line

  const NavBar({super.key, this.initialIndex = 0}); // Provide a default value

  @override
  // ignore: library_private_types_in_public_api
  _InstagramNavBarState createState() => _InstagramNavBarState();
}

class _InstagramNavBarState extends State<NavBar> {
  late int _currentIndex; // Remove the initialization here

  @override
  void initState() {
    Provider.of<ThemeProvider>(context, listen: false).getUserDetailes();
    super.initState();
    _currentIndex =
        widget.initialIndex; // Initialize with the provided initial index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // me == null
      // ?
      // const Center(child: CircularProgressIndicator(),)
      // :
      body: _buildPage(_currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 4,
              color: Theme.of(context).colorScheme.secondary,
              offset: const Offset(0, -1))
        ]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.primary,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? const Icon(Icons.home_filled)
                  : Icon(Icons.home_outlined,
                      color: Theme.of(context).colorScheme.primary),
              label: S.of(context).NavHome,
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? const Icon(Icons.book)
                  : Icon(Icons.book_outlined,
                      color: Theme.of(context).colorScheme.primary),
              label: S.of(context).NavLibrary,
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? const Icon(Icons.chat_bubble)
                  : Icon(Icons.chat_bubble_outline,
                      color: Theme.of(context).colorScheme.primary),
              label: S.of(context).NavChat,
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? const Icon(Icons.person)
                  : Icon(Icons.person_2_outlined,
                      color: Theme.of(context).colorScheme.primary),
              label: S.of(context).Profile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const News();
      case 1:
        return const Library();
      case 2:
        return const Chat();
      case 3:
        return const Student();

      default:
        return Container();
    }
  }
}

class OutlineIcon extends StatelessWidget {
  final IconData icon;

  const OutlineIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Example item count
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Your custom content for the Search page
    return const Center(child: Text('Search Page Content'));
  }
}

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Your custom content for the Add page
    return const Center(child: Text('Add Page Content'));
  }
}

class ActivityContent extends StatelessWidget {
  const ActivityContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Your custom content for the Activity page
    return const Center(child: Text('Activity Page Content'));
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Your custom content for the Profile page
    return const Center(child: Text('Profile Page Content'));
  }
}
