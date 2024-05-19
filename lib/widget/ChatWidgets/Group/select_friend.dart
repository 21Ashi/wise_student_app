import 'package:flutter/material.dart';

class SelectFriends extends StatefulWidget {
  const SelectFriends({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectableImageListState createState() => _SelectableImageListState();
}

class _SelectableImageListState extends State<SelectFriends> {
  List<bool> selectedImages = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: selectedImages.length,
      itemBuilder: (context, index) {
        return SelectableImage(
          imagePath: 'assets/user1.png', // Replace with your image asset path
          isSelected: selectedImages[index],
          onTap: () {
            setState(() {
              selectedImages[index] = !selectedImages[index];
            });
          },
        );
      },
    );
  }
}

class SelectableImage extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableImage({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        color: isSelected ? Colors.grey : null,
        child: Image.asset(
          imagePath,
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
