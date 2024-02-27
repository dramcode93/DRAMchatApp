import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomModalProfile extends StatelessWidget {
  const CustomModalProfile({
    super.key,
    required this.selectCamera,
    required this.selectImage,
    required this.removeImg,
    required this.image,
  });
  final VoidCallback? selectCamera;
  final VoidCallback? selectImage;
  final VoidCallback? removeImg;
  // Uint8List? image;
  final XFile? image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.remove,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.camera_alt),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          selectCamera!();
                        },
                        child: const Text(
                          'Camera',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.photo_library),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          selectImage!();
                        },
                        child: const Text(
                          'Gallary',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (image != null)
                    Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            removeImg!();
                          },
                          child: const Text(
                            'Delete image',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
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
      ),
    );
  }
}
