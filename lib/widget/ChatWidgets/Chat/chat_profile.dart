import 'package:flutter/material.dart';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/provider/provider_theme.dart';
import 'package:wise_student_app/widget/ChatWidgets/Group/add_group.dart';
import 'package:wise_student_app/widget/ChatWidgets/Group/group_list_item.dart';
import 'package:wise_student_app/widget/ChatWidgets/Chat/chat_text_tab.dart';
import 'package:wise_student_app/widget/ChatWidgets/floating_bottom.dart';
import 'package:wise_student_app/widget/ChatWidgets/row_items.dart';
import 'package:wise_student_app/widget/ChatWidgets/search_bar.dart';
import 'package:wise_student_app/widget/ChatWidgets/user_1.dart';
import 'package:provider/provider.dart';

class Chatprofile extends StatefulWidget {
  const Chatprofile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatprofileState createState() => _ChatprofileState();
}

class _ChatprofileState extends State<Chatprofile>
    with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController();
  bool isExpanded = false;
  bool showFriends = true;
  List<AlphaModel> alphabetList = [];
  List myContacts = [];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Image.asset('assets/user.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).GoodMornaing,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      prov.me?.fname ?? '', // Null check for prov.me and fname
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.24,
              ),
              const SearchButton(),
              const AddGroup(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: isExpanded || !showFriends ? 0 : 140,
          child: Visibility(
              visible: !isExpanded && showFriends, child: const RowChat()),
        ),
        const SizedBox(
          height: 5,
        ),
        // Container(
        //   height: 5,
        //   width: 50,
        //   decoration: BoxDecoration(
        //       color: Theme.of(context).colorScheme.background,
        //       borderRadius: BorderRadius.circular(30)),
        // ),

        ChatTextTab(
          tabTitles: const [
            "Chat"
                '',
            "Groups",
          ],
          onTabSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        const SizedBox(
          height: 5,
        ),
        getContentWidget(_selectedIndex),
        // const ChatContainer(),
        const FloatingButton(),
      ],
    );
  }
}

Widget getContentWidget(int index) {
  switch (index) {
    case 0:
      return const ChatContainer(); //
    case 1:
      return const GroupContainer();
    default:
      return Container();
  }
}

class ChatContainer extends StatelessWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    bool showFriends = true;
    return Container(
      // ignore: dead_code
      height: isExpanded || !showFriends ? 535 : 370,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0, left: 32.0, top: 20),
            child: Row(
              children: [
                Text(
                  S.of(context).Chat,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24),
                ),
              ],
            ),
          ),
          const Expanded(child: UserListItem()),
        ],
      ),
    );
  }
}

class GroupContainer extends StatelessWidget {
  const GroupContainer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    bool showFriends = true;
    return Container(
      // ignore: dead_code
      height: isExpanded || !showFriends ? 535 : 370,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0, left: 32.0, top: 20),
            child: Row(
              children: [
                Text(
                  'Groups',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24),
                ),
              ],
            ),
          ),
          const Expanded(child: GroupListItem()),
        ],
      ),
    );
  }
}
