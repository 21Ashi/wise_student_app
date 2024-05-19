import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wise_student_app/models/courses_model.dart';
import 'package:wise_student_app/models/group_model.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/models/room_model.dart';
import 'package:uuid/uuid.dart';

class FireData {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String myUid = FirebaseAuth.instance.currentUser!.uid;

  Future createRoom(String email) async {
    QuerySnapshot userEmail = await firestore
        .collection('students')
        .where('std_email', isEqualTo: email)
        .get();

    if (userEmail.docs.isNotEmpty) {
      String userId = userEmail.docs.first.id;
      List<String> members = [myUid, userId]..sort(
          (a, b) => a.compareTo(b),
        );

      QuerySnapshot roomExist = await firestore
          .collection('ChatRooms')
          .where('members', isEqualTo: members)
          .get();

      if (roomExist.docs.isEmpty) {
        ChatRoom chatRoom = ChatRoom(
          id: members.toString(),
          createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
          members: members,
          lastMessage: "",
          lastMessageTime: DateTime.now().millisecondsSinceEpoch.toString(),
        );

        firestore
            .collection('ChatRooms')
            .doc(members.toString())
            .set(chatRoom.toJson());
      }
    }
  }

  Future createGroup(String name, List members) async{
    String gId= const Uuid().v1();
    members.add(myUid);
    ChatGroup chatGroup= ChatGroup(
      id: gId,
      name: name,
      members: members,
      admins: [myUid],
      lastMessage: '',
      lastMessageTime: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    await firestore
      .collection('groups')
      .doc(gId)
      .set(chatGroup.toJson());
  }


  Future sendMessage(String uid, String msg, String roomId,
      {String? type}) async {
    String msgId = const Uuid().v1();
    Message message = Message(
        id: msgId,
        toId: uid,
        fromId: myUid,
        msg: msg,
        type: type ?? 'text',
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        read: '',
        message: '');

    await firestore
        .collection('ChatRooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set(message.toJson());

    firestore.collection('ChatRooms').doc(roomId).update({
      'last_message': msg,
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  Future readMessage(String roomId, String msgId) async {
    await firestore
        .collection('ChatRooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .update({
      'read': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  deleteMsg(String roomId, List<String> msgs) async {
    // ignore: unused_local_variable
    List<String> msgsCopy = List.from(msgs);

    for (var element in msgs) {
      await firestore
          .collection('ChatRooms')
          .doc(roomId)
          .collection('messages')
          .doc(element)
          .delete();
    }
  }
  
  Future addBooks(String title, String author, String category,
      String description, String pages, String language, String release, File image) async {
    String bookId = const Uuid().v1();
    String imageUrl = await uploadImageToFirebaseStorage(image, bookId);
    
    print('xxx');
    print(imageUrl);

    await firestore.collection('books').add({
      'id': bookId,
      'title': title,
      'author': author,
      'category': category,
      'description': description,
      'pages': pages,
      'language': language,
      'release': release,
      'image':imageUrl
    });
  }

  Future addpost(
      {required String title,
      required File image,
      required String description,
      required String whoCanSee}) async {
    String postId = const Uuid().v1();
    String imageUrl = await uploadImageToFirebaseStorage(image, postId);

    print('xxx');
    print(imageUrl);

    await firestore.collection('news').add({
      'id': postId,
      'title': title,
      'description': description,
      'image': imageUrl,
      'created_at': DateTime.now().millisecondsSinceEpoch.toString(),
      'who_can_see': whoCanSee,
      'author': myUid,
    });
  }

  Future createStudentCourseTable(String name, List members) async{
    String cId= const Uuid().v1();
    StudentTable chatGroup= StudentTable(
      cId: cId,
      stdId: myUid,
      courseName: '',
      period: '',
      days: '',
      location: '',
      instructorName: '',
      creditHours: '',
    );
    await firestore
      .collection('Student Schedual')
      .doc(cId)
      .set(chatGroup.toJson());
  }

  Future uploadImageToFirebaseStorage(File image, String postId) async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child('news_images/$postId.jpg');
    UploadTask uploadTask = storageReference.putFile(image);
    String imageUrl = await (await uploadTask).ref.getDownloadURL();
    return imageUrl;
  }
}
