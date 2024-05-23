import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/ChatWidgets/gridview.dart';
import 'package:wise_student_app/widget/ChatWidgets/row_items.dart';

class AddGroup extends StatelessWidget {
  final List<QueryDocumentSnapshot> data;

  const AddGroup({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showImageSelectionBottomSheet(context);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(20, 20),
        backgroundColor: const Color(0xff77B2E1),
        side: BorderSide(color: Theme.of(context).colorScheme.background),
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.background,
        size: 17,
      ),
    );
  }

  void _showImageSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const SizedBox(
          height: 550,
          child: ImageSelectionBottomSheet(),
        );
      },
    );
  }
}

class ImageSelectionBottomSheet extends StatefulWidget {
  const ImageSelectionBottomSheet({super.key});

  @override
  _ImageSelectionBottomSheetState createState() =>
      _ImageSelectionBottomSheetState();
}

class _ImageSelectionBottomSheetState extends State<ImageSelectionBottomSheet> {
  late List<bool> selectedImages;
  List<DocumentSnapshot> usersData = [];

  @override
  void initState() {
    super.initState();
    selectedImages = []; // Initialize selectedImages here
    _fetchUsersData();
  }

  Future<void> _fetchUsersData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('students').get();
    setState(() {
      usersData.addAll(querySnapshot.docs);
      selectedImages = List.filled(
          usersData.length, false); // Initialize selectedImages here as well
      print(usersData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10),
      child: Column(
        children: <Widget>[
          Text(
            S.of(context).CreateGroup,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            S.of(context).ChooseMember,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Text(
            '${usersData.length} Member',
            style: const TextStyle(
              color: Color(0xffFF5C1C),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              itemCount: usersData.length,
              itemBuilder: (context, index) {
                var userData = usersData[index].data() as Map<String, dynamic>?;

                // Add null check for userData
                if (userData == null) {
                  return const SizedBox(); // Or some placeholder widget
                }

                return GridCard(
                  fname: userData['fname'] ?? '',
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Container(
              height: 40,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
                color: Colors.orange[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  S.of(context).NewGroup,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
