import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/News/news_details.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({super.key});

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  bool isContainerVisible = true;

  void _onDeletePressed() {
    setState(() {
      isContainerVisible = false;
      _showUndoSnackbar();
    });
  }

  void _showUndoSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          S.of(context).PostDeleted,
          style: const TextStyle(fontSize: 12),
        ),
        action: SnackBarAction(
          label: S.of(context).undo,
          onPressed: () {
            setState(() {
              isContainerVisible = true;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            height: 1.0,
          ),
        ),
        title: Text(S.of(context).SavedPosts,
            style: GoogleFonts.hammersmithOne(
                fontSize: 22, color: Theme.of(context).colorScheme.primary)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                S.of(context).UnderSavedPosts,
                style: GoogleFonts.karma(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 10),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
            visible: isContainerVisible,
            child: InkWell(
              onTap: () {
                //Get.to(() => const NewsDetails());
              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        offset: const Offset(0, 2))
                  ],
                  color: Theme.of(context).colorScheme.background,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Text(
                        S.of(context).SpecifiedNews,
                        style: GoogleFonts.bakbakOne(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            S.of(context).SpecifiedNewsDate,
                            style: GoogleFonts.karma(
                                fontSize: 8,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                        InkWell(
                          onTap: _onDeletePressed,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
