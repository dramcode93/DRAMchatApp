import 'package:dram/widgets/CustomModalChat.dart';
import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  const Person({
    super.key,
    required this.name,
    required this.lastMsg,
    required this.lastTime,
  });
  final String? name, lastMsg, lastTime;
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
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: const AssetImage('assets/images/profile.png'),
          child: Container(
            decoration: const ShapeDecoration(
              shape: CircleBorder(eccentricity: 1),
            ),
            child: MaterialButton(
              onPressed: () {},
            ),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              lastTime!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            // Transform.rotate(
            //   angle: 3.1415926535 / 4,
            //   child: Icon(
            //     Icons.push_pin,
            //     size: 20,
            //     color: Colors.grey,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
