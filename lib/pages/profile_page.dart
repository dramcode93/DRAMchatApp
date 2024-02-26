import 'package:dram/models/select_image.dart';
import 'package:dram/widgets/custom_button.dart';
//import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' as foundation;

class Profile extends StatefulWidget {
  Profile({super.key});
  static String id = 'ProfilePage';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _emojiShowing = false;
  Uint8List? image;
  void selectImage() async {
    Uint8List? ing = await pickImage(ImageSource.gallery);
    setState(() {
      image = ing;
    });
  }

  void selectCamira() async {
    Uint8List? ing = await pickImage(ImageSource.camera);
    setState(() {
      image = ing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Create Your Profile',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            // const Text(
            //   'Create Your Profile',
            //   style: TextStyle(
            //     fontSize: 30,
            //     // fontWeight: FontWeight.bold,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            // // const SizedBox(
            //   height: 50,
            // ),
            const Spacer(
              flex: 1,
            ),
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: MemoryImage(image!),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                Positioned(
                  bottom: 0,
                  right: 65,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: const Color(0xff322653),
                        borderRadius: BorderRadius.circular(25)),
                    //height: 3,
                    child: Center(
                      child: IconButton(
                        iconSize: 20,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 200,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.remove,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 50, left: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.camera_alt),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    selectCamira();
                                                  },
                                                  child: Text(
                                                    'Camera',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.photo_library),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    selectImage();
                                                  },
                                                  child: Text(
                                                    'Gallary',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Text(
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
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // const Spacer(
            //   flex: 1,
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 332,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // setState(() {
                        //   _emojiShowing = !_emojiShowing;
                        // });
                      },
                      icon: const Icon(
                        Icons.emoji_emotions_outlined, //emoji_emotions
                        size: 28,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 230,
            // ),
            // Offstage(
            //   offstage: !_emojiShowing,
            //   child: EmojiPicker(
            //     textEditingController: _controller,
            //     scrollController: _scrollController,
            //     config: Config(
            //       height: 256,
            //       checkPlatformCompatibility: true,
            //       emojiViewConfig: EmojiViewConfig(
            //         // Issue: https://github.com/flutter/flutter/issues/28894
            //         emojiSizeMax: 28 *
            //             (foundation.defaultTargetPlatform ==
            //                     TargetPlatform.android
            //                 ? 1.2
            //                 : 1.0),
            //       ),
            //       swapCategoryAndBottomBar: false,
            //       skinToneConfig: const SkinToneConfig(),
            //       categoryViewConfig: const CategoryViewConfig(),
            //       bottomActionBarConfig: const BottomActionBarConfig(),
            //       searchViewConfig: const SearchViewConfig(),
            //     ),
            //   ),
            // ),
            const Spacer(
              flex: 4,
            ),
            CustomBtn(
              btnText: 'Finish',
              btnColor: const Color(0xff322653),
              txtColor: Colors.white,
              onTap: () {},
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
