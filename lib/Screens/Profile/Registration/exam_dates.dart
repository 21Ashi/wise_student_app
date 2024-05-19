import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExamsDate extends StatelessWidget {
  const ExamsDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Exam Dates',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const MyTable(),
    );
  }
}

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, right: 8, left: 8),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  color: Theme.of(context).colorScheme.secondary)
            ],
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(15)),
        child: const ExamsDateTable(),
      ),
    );
  }
}


class ExamsDateTable extends StatefulWidget {
  const ExamsDateTable({super.key});

  @override
  State<ExamsDateTable> createState() => _ExamsDateTableState();
}

class _ExamsDateTableState extends State<ExamsDateTable> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? currentUser = _auth.currentUser;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              color: Theme.of(context).colorScheme.secondary,
            )
          ],
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('ExamsDate').where('id', isEqualTo: currentUser?.uid).snapshots(), // Filter data based on the current user's UID
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Placeholder for loading state
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data available'); // Placeholder for no data state
            } else {
              List<DataRow> rows = snapshot.data!.docs.map((doc) {
                Map<String, dynamic> courseData = doc.data() as Map<String, dynamic>;
                return DataRow(
                  cells: [
                    DataCell(Text(courseData['course_name'] ?? '')),
                    DataCell(Text(courseData['date'] ?? '')),
                    DataCell(Text(courseData['day'] ?? '')),
                    DataCell(Text(courseData['period'] ?? '')),
                    DataCell(Text(courseData['location'] ?? '')),
                  ],
                );
              }).toList();

              return FittedBox(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Course Name')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Day')),
                    DataColumn(label: Text('Period')),
                    DataColumn(label: Text('Location')),
                  ],
                  rows: rows,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
