import 'package:dram/widgets/person.dart';
import 'package:flutter/material.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ListTile(
          title: const Text(
            'Mahmoud Taha',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'Lorem ipsum',
            style: TextStyle(
              color: Colors.grey,
            ),
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
              const Text(
                '12:30 pm',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Transform.rotate(
                angle: 3.1415926535 / 4,
                child: const Icon(
                  Icons.push_pin,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        // Person(
        //   name: 'Mahmoud Taha',
        //   lastMsg: "Lorem ipsum",
        //   lastTime: '12:30 pm',
        // ),
        const Person(
          name: 'Mahmoud Taha',
          lastMsg: "Lorem ipsum",
          lastTime: '12:00 pm',
        ),
        const Person(
          name: 'Mahmoud Taha',
          lastMsg: "Lorem ipsum",
          lastTime: '11:00 pm',
        ),
        const Person(
          name: 'Mahmoud Taha',
          lastMsg: "Lorem ipsum",
          lastTime: '9:49 am',
        ),
        const Person(
          name: 'Mahmoud Taha',
          lastMsg: "Typing...",
          lastTime: '8:00 am',
        ),
        const Person(
          name: 'Mahmoud Taha',
          lastMsg: "Recording voice...",
          lastTime: '9:30 am',
        ),
      ],
    );
  }
}
