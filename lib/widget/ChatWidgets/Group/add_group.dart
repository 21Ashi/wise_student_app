import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';

class AddGroup extends StatelessWidget {
  const AddGroup({
    super.key,
  });

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
  // ignore: library_private_types_in_public_api
  _ImageSelectionBottomSheetState createState() =>
      _ImageSelectionBottomSheetState();
}

class _ImageSelectionBottomSheetState extends State<ImageSelectionBottomSheet> {
  TextEditingController email = TextEditingController();
  late List<bool> selectedImages;
  final List<String> imagePaths = [
    'assets/friend1.png',
    'assets/friend2.png',
    'assets/friend3.png',
    'assets/friend4.png',
    'assets/friend5.png',
    'assets/friend6.png',
    'assets/friend7.png',
    'assets/friend8.png',
    'assets/friend9.png',
  ];

  @override
  void initState() {
    super.initState();
    selectedImages = List.filled(imagePaths.length, false);
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
            S.of(context).MembersNumber,
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
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImages[index] = !selectedImages[index];
                        });
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: ColorFiltered(
                                colorFilter: selectedImages[index]
                                    ? ColorFilter.mode(
                                        Colors.black.withOpacity(0.7),
                                        BlendMode.srcOver)
                                    : const ColorFilter.mode(
                                        Colors.transparent, BlendMode.srcOver),
                                child: Image.asset(
                                  imagePaths[index],
                                  height: 85,
                                  width: 85,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          if (selectedImages[index])
                            const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${S.of(context).SenderName} ${index + 1}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
              height: 40,
              width: 280,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 2),
                      blurRadius: 4)
                ],
                gradient: const LinearGradient(
                  colors: [Color(0xffF9AD70), Color(0xffFF5717)],
                ),
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
