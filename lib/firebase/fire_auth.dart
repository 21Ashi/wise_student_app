import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wise_student_app/models/user_model.dart';

class FireAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static User user = auth.currentUser!;

  static Future createUser() async {
    Std student = Std(
      id: user.uid,
      fname: user.displayName ?? "",
      degree: 'Bachelor',
      major: '',
      academicAdvisor: '',
      stdEmail: user.email ?? "",
      phoneNumber: '',
      eLearningPass: '',
      teamsPass: '',
      image: '',
      lastActivated: DateTime.now().millisecondsSinceEpoch.toString(),
      pushToken: '',
      online: false,
      stdId: '',
      myUsers: [],
    );
    await firebaseFirestore
        .collection('students')
        .doc(user.uid)
        .set(student.toJson());
  }
}
