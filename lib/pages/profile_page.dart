import 'dart:io';
import 'package:dram/models/select_image.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/custom_modal_code.dart';
import 'package:dram/widgets/custom_modal_profile.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter/foundation.dart' as foundation;

class Profile extends StatefulWidget {
  const Profile({super.key});
  static String id = 'ProfilePage';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // final _controller = TextEditingController();
  // final _scrollController = ScrollController();
  bool _emojiShowing = false;
  Uint8List? image;

  XFile? _pickedImage;
  // CroppedFile? _croppedImage;

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
          activeControlsWidgetColor: Color.fromARGB(255, 97, 80, 145),
          showCropGrid: true,
          hideBottomControls: true,
        ),
      ],
    );
    _pickedImage = XFile(result!.path);

    setState(() {});
  }

  void selectImage() async {
    // Uint8List? ing = await pickImage(ImageSource.gallery);
    // setState(() {
    //   image = ing;
    // });
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      _pickedImage = result;
      cropImage();
      // setState(() {});
    }
  }

  void selectCamera() async {
    // Uint8List? ing = await pickImage(ImageSource.camera);
    // setState(() {
    //   image = ing;
    // });
    var result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      _pickedImage = result;
      cropImage();
      // setState(() {});
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
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: const Text(
      //     'Create Your Profile',
      //     style: TextStyle(color: Colors.black, fontSize: 28),
      //   ),
      // ),
      body: ListView(
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
                const Text(
                  'Create Your Profile',
                  style: TextStyle(
                    fontSize: 30,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 70,
                ),
                // const Spacer(
                //   flex: 1,
                // ),
                Stack(
                  children: [
                    // image != null
                    _pickedImage != null
                        ? CircleAvatar(
                            radius: 65,
                            // backgroundImage: MemoryImage(image!),
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
                            borderRadius: BorderRadius.circular(25)),
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
                                    // image: image,
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
                            setState(() {
                              _emojiShowing = !_emojiShowing;
                            });
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
                // const Spacer(
                //   flex: 4,
                // ),
                const SizedBox(
                  height: 250,
                ),
                CustomBtn(
                  btnText: 'Finish',
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
