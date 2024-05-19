import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/name_id_container.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).SubjectsList,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        color: Theme.of(context).colorScheme.secondary)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer)),
              child: Center(
                  child: Text(
                S.of(context).FirstSemester,
                style: const TextStyle(fontSize: 12),
              )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const NameIdContainer(),
          const SubjectListTable()
        ],
      ),
    );
  }
}


class SubjectListTable extends StatefulWidget {
  const SubjectListTable({super.key});

  @override
  State<SubjectListTable> createState() => _SubjectListTableState();
}

class _SubjectListTableState extends State<SubjectListTable> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
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
          stream: _firestore.collection('SubjectList').snapshots(),
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
                    DataCell(Text(courseData['period'] ?? '')),
                    DataCell(Text(courseData['location'] ?? '')),
                    DataCell(Text(courseData['instructor_name'] ?? '')),
                    DataCell(Text(courseData['ch'] ?? '')),
                    DataCell(Text(courseData['days'] ?? '')),
                  ],
                );
              }).toList();

              return FittedBox(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Course Name')),
                    DataColumn(label: Text('C.H')),
                    DataColumn(label: Text('Days')),
                    DataColumn(label: Text('period')),
                    DataColumn(label: Text('location')),
                    DataColumn(label: Text('instructor Name')),
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