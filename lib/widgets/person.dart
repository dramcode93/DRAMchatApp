import 'package:dram/constants.dart';
import 'package:dram/widgets/CustomModalChat.dart';
import 'package:dram/widgets/person_dialog.dart';
import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  const Person({
    super.key,
    required this.name,
    required this.lastMsg,
    required this.lastTime,
    this.image = kProfile,
  });
  final String? name, lastMsg, lastTime, image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const CustomModalChat();
          },
          transitionAnimationController: AnimationController(
            vsync: Navigator.of(context),
            duration: const Duration(
              milliseconds: 500,
            ),
          ),
        );
      },
      child: ListTile(
        title: Text(
          name!,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.check,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              lastMsg!,
              style: TextStyle(
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(image!),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: MaterialButton(
              shape: const CircleBorder(),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        // child: SlideTransition(
                        //   position: Tween<Offset>(
                        //     begin: Offset(-0.1, 0.0),
                        //     end: Offset(0, 0),
                        //   ).animate(CurvedAnimation(
                        //     parent: ModalRoute.of(context)!.animation!,
                        //     curve: Curves.linear,
                        //   )),
                        child: ScaleTransition(
                          scale: Tween<double>(
                            begin: 0.0,
                            end: 1.0,
                          ).animate(
                            CurvedAnimation(
                              parent: ModalRoute.of(context)!.animation!,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          // child: AlertDialog(
                          //   elevation: 0,
                          //   backgroundColor: Colors.transparent,
                          //   shape: Border(),
                          //   clipBehavior: Clip.none,
                          //   iconPadding: EdgeInsets.all(0),
                          //   contentPadding: EdgeInsets.all(0),
                          //   titlePadding: EdgeInsets.all(0),
                          //   insetPadding: EdgeInsets.all(0),
                          //   actionsPadding: EdgeInsets.all(0),
                          //   buttonPadding: EdgeInsets.all(0),
                          //   content: SizedBox(
                          //     height: bodyHeight * 0.7,
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           height: 200,
                          //           // width: double.infinity,
                          //           width: 210,
                          //           decoration: BoxDecoration(
                          //             image: DecorationImage(
                          //               image: NetworkImage(
                          //                 image!,
                          //               ),
                          //               fit: BoxFit.cover,
                          //               filterQuality: FilterQuality.high,
                          //             ),
                          //           ),
                          //           child: Padding(
                          //             padding: const EdgeInsets.only(left: 8),
                          //             child: Text(
                          //               name!,
                          //               style: TextStyle(
                          //                 fontSize: 16,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         Container(
                          //           width: 210,
                          //           color: Theme.of(context).backgroundColor,
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             children: [
                          //               IconButton(
                          //                   onPressed: () {},
                          //                   icon: Icon(Icons.chat_bubble)),
                          //               IconButton(
                          //                   onPressed: () {},
                          //                   icon: Icon(Icons.call)),
                          //               IconButton(
                          //                   onPressed: () {},
                          //                   icon: Icon(Icons.video_call)),
                          //               IconButton(
                          //                   onPressed: () {},
                          //                   icon: Icon(Icons.info)),
                          //             ],
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          child: CustomAlertDialog(
                            image: image!,
                            name: name!,
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              lastTime!,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 12,
              ),
            ),
            // Transform.rotate(
            //   angle: 3.1415926535 / 4,
            //   child: Icon(
            //     Icons.push_pin,
            //     size: 20,
            //     color: Theme.of(context).hintColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
