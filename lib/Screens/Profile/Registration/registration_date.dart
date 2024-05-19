import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/provider/provider_theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

class RegistrationDate extends StatelessWidget {
  const RegistrationDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        title: Text(
          S.of(context).RegistrationDate,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
    final prov = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            S.of(context).Welcomeback,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                prov.me!.fname.toString(),
              ),
              const Text(' - '),
              Text(
                prov.me!.stdEmail.toString(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: RegistrationDateTable()
          ),
        ],
      ),
    );
  }
}




class RegistrationDateTable extends StatefulWidget {
  const RegistrationDateTable({super.key});

  @override
  State<RegistrationDateTable> createState() => _RegistrationDateTableState();
}

class _RegistrationDateTableState extends State<RegistrationDateTable> {
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
          stream: _firestore.collection('RegistrationDate').where('id', isEqualTo: currentUser?.uid).snapshots(), // Filter data based on the current user's UID
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
                    DataCell(Text(courseData['date'] ?? '')),
                    DataCell(Text(courseData['day'] ?? '')),
                    DataCell(Text(courseData['starts_at'] ?? '')),
                    DataCell(Text(courseData['ends_at'] ?? '')),
                  ],
                );
              }).toList();

              return FittedBox(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Day')),
                    DataColumn(label: Text('Starts at')),
                    DataColumn(label: Text('Ends at')),
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
