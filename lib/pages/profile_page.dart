import 'dart:io';
import 'package:dram/generated/l10n.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/custom_modal_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});
  static String id = 'ProfilePage';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // TextEditingController _nameController = TextEditingController();
  // bool _emojiShowing = false;
  // bool _showEmojiPicker = false;
  //
  // void toggleEmojiPicker() {
  //   setState(() {
  //     _showEmojiPicker = !_showEmojiPicker;
  //     print('Emoji Picker Visibility: $_showEmojiPicker');
  //   });
  // }

  Uint8List? image;
  XFile? _pickedImage;

  cropImage() async {
    var result = await ImageCropper().cropImage(
      sourcePath: _pickedImage!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.square,
      ],
      cropStyle: CropStyle.rectangle,
      aspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 3),
      uiSettings: [
        AndroidUiSettings(
          lockAspectRatio: false,
          toolbarTitle: '',
          statusBarColor: Colors.black,
          // toolbarColor: Color(0xff322653),
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: const Color.fromARGB(255, 97, 80, 145),
          showCropGrid: true,
          hideBottomControls: true,
        ),
      ],
    );
    _pickedImage = XFile(result!.path);

    setState(() {});
  }

  void selectImage() async {

    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      _pickedImage = result;

      cropImage();

    }
  }

  void selectCamera() async {
    var result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      _pickedImage = result;
      cropImage();

    }
  }

  @override
  Widget build(BuildContext context) {
    void removeImg() {
      setState(() {
        // image = null;
        _pickedImage = null;
      });
    }

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Column(
              children: [
                // const Spacer(
                //   flex: 1,
                // ),
                const SizedBox(
                  height: 70,
                ),
                Text(
                  // 'Create Your Profile',
                  S.of(context).profileTitle,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 70,
                ),

                Stack(
                  children: [
                    // image != null
                    _pickedImage != null
                        ? CircleAvatar(
                            radius: 65,
                            backgroundImage: FileImage(
                              File(_pickedImage!.path),
                            ),
                          )
                        : const CircleAvatar(
                            radius: 65,
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                    Positioned(
                      bottom: 0,
                      right: 85,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xff322653),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        //height: 3,
                        child: Center(
                          child: IconButton(
                            iconSize: 20,
                            onPressed: () {
                              setState(() {});
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomModalProfile(
                                    removeImg: removeImg,
                                    selectCamera: selectCamera,
                                    selectImage: selectImage,
                                    image: _pickedImage,
                                  );
                                },
                                transitionAnimationController:
                                    AnimationController(
                                  vsync: Navigator.of(context),
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                ),
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
                      // controller: EmojiTextEditingController(),
                      decoration: InputDecoration(
                        // hintText: 'Name',
                        hintText: S.of(context).profileHint,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: IconButton(
                          onPressed: (){
                            // toggleEmojiPicker();
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
                // Visibility(
                //   visible: _showEmojiPicker,
                //   child: EmojiPicker(
                //     onEmojiSelected: (emoji, category) {
                //       // Handle emoji selection
                //     },
                //   ),
                // ),
                // const SizedBox(
                //   height: 190,
                // ),
                CustomBtn(
                  // btnText: 'Finish',
                  btnText: S.of(context).ProfileFinish,
                  btnColor: const Color(0xff322653),
                  txtColor: Colors.white,
                  onTap: () {},
                ),
                // const Spacer(
                //   flex: 1,
                // ),
                const SizedBox(
                  height: 70,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
