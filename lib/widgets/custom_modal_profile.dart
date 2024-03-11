import 'package:dram/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomModalProfile extends StatefulWidget {
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
  State<CustomModalProfile> createState() => _CustomModalProfileState();
}

class _CustomModalProfileState extends State<CustomModalProfile> {


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
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.camera_alt),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () async {

                          if (await Permission.camera.isGranted) {

                            widget.selectCamera!();
                          } else {

                            PermissionStatus status =
                                await Permission.camera.request();

                            if (status == PermissionStatus.granted) {
                              widget.selectCamera!();
                            } else {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Camera permission is required to select camera'),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
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
                          widget.selectImage!();
                        },
                        child: Text(
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
                  if (widget.image != null)
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
                            widget.removeImg!();
                          },
                          child: Text(
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
