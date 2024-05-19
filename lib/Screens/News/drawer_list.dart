import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wise_student_app/Screens/News/saved_posts.dart';
import 'package:wise_student_app/Screens/News/settings_screen.dart';
import 'package:wise_student_app/Screens/News/draft_posts.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/provider/provider_theme.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ThemeProvider>(context);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.background),
            accountName: Row(
              children: [
                Text(
                  prov.me!.fname.toString(),
                  style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            accountEmail: Text(
              prov.me!.stdEmail.toString(),
                style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.primary)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/man.jpg',
                    height: 70, width: 70, fit: BoxFit.cover),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.save_outlined,
                color: Theme.of(context).colorScheme.primary),
            title: Text(
              S.of(context).SavedPosts,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Get.to(() => const SavedPosts());
            },
          ),
          ListTile(
            leading: Icon(Icons.drafts_outlined,
                color: Theme.of(context).colorScheme.primary),
            title: Text(S.of(context).DraftPosts,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Get.to(() => const DraftPosts());
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined,
                color: Theme.of(context).colorScheme.primary),
            title: Text(S.of(context).Settings,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Get.to(() => const Settings());
            },
          )
        ],
      ),
    );
  }
}
