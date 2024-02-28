import 'package:dram/generated/l10n.dart';
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
              size: 32,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20,right: 20),
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
                        child: Text(
                          // 'Camera',
                           S.of(context).Camera,
                          style: const TextStyle(fontSize: 18),
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
                        child:  Text(
                          // 'Gallary',
                          S.of(context).Gallary,
                          style: const TextStyle(fontSize: 18),
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
                          child:  Text(
                            // 'Delete image',
                            S.of(context).DeleteImage,
                            style: const TextStyle(
                              fontSize: 18,
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
