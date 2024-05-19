import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wise_student_app/firebase/fire_database.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/nav_bar.dart';

class AddBook extends StatelessWidget {
  const AddBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: InkWell(
            onTap: () {
              Get.to(() => const NavBar(
                    initialIndex: 1,
                  ));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.primary,
            )),
        title: Text(
          S.of(context).AddBook,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: const YourAddContent(),
    );
  }
}

class YourAddContent extends StatefulWidget {
  const YourAddContent({super.key});

  @override
  State<YourAddContent> createState() => _YourAddContentState();
}

class _YourAddContentState extends State<YourAddContent> {
  final TextEditingController _booktitle = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _numpage = TextEditingController();
  final TextEditingController _language = TextEditingController();
  final TextEditingController _release = TextEditingController();
  File? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).BookTitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.background,),
                  child: TextField(
                    controller: _booktitle,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.library_books,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: S.of(context).BookTitle,
                      hintStyle:TextStyle(color: Colors.grey[700], fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,),
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  S.of(context).Author,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.background,),
                  child: TextField(
                    controller: _author,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: S.of(context).Author,
                      hintStyle:TextStyle(color: Colors.grey[700], fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,),
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  S.of(context).Category,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.background,),
                  child: TextField(
                    controller: _category,
                    decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.library_books,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    hintText: S.of(context).Category,
                    hintStyle:TextStyle(color: Colors.grey[700], fontSize: 14),
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,),
                    borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  S.of(context).NewPostDescription,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: TextField(
                      controller: _description,
                      decoration: InputDecoration(
                        hintText: S.of(context).TypeHere,
                        hintStyle:TextStyle(color: Colors.grey[700], fontSize: 14),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              S.of(context).BookPage,
                              style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 14),
                            ),
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: TextField(
                                controller: _numpage,
                                style: Theme.of(context).textTheme.bodyMedium,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              S.of(context).BookLanguage,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: TextField(
                                controller: _language,
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              S.of(context).BookRelease,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: TextField(
                                controller: _release,
                                style: Theme.of(context).textTheme.bodyMedium,
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 120)
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        "Book cover",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 14,
                        ),
                      ),
                      // MyGallery(
                      //   onImageUploaded: (String? image_path) {
                      //     if (image_path != null) {
                      //       setState(() {
                      //         _image = File(image_path);
                      //       });
                      //     }
                      //   },
                      // ),
                    ],
                  )
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (_image != null) {
                          FireData().addBooks(
                            _booktitle.text,
                            _author.text,
                            _category.text,
                            _description.text,
                            _numpage.text,
                            _language.text,
                            _release.text,
                            _image!,
                          ).then((value){
                            setState(() {
                              _booktitle.text = " ";
                              _author.text = " ";
                              _category.text = " ";
                              _description.text = " ";
                              _numpage.text = " ";
                              _language.text = " ";
                              _release.text = " ";
                              _image = null;
                            });
                            Navigator.of(context).pop;
                          });;
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed')));
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xff77B2E1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(9),
                        child: Center(
                          child: Text(
                            S.of(context).save,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const NavBar(initialIndex: 1,));
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(9),
                        child: Center(
                          child: Text(
                            S.of(context).Cancel,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),    
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${returnImage?.path}")));
    if (returnImage == null) return;

    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path);
    });
  }
}
