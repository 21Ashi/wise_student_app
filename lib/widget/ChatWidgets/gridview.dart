import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RowChat extends StatelessWidget {
  const RowChat({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('students').snapshots(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshots.hasError) {
          return const Center(child: Text('Error loading data'));
        } else if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
          return const Center(child: Text('No students found'));
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (context, index) {
              var data =
                  snapshots.data!.docs[index].data() as Map<String, dynamic>;
              return GridCard(
                fname: data['fname'],
              );
            },
          );
        }
      },
    );
  }
}

class GridCard extends StatefulWidget {
  final String fname;

  const GridCard({
    super.key,
    required this.fname,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GridCardState createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  bool isSelected = false; // Add a boolean to track selection state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle selection state on tap
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/user1.png',
                      width:
                          70, // Set a width and height for the circular image
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (isSelected)
                  ClipOval(
                    child: Container(
                      width: 70,
                      height: 70,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                if (isSelected)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              widget.fname,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
