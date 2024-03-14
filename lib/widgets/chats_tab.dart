import 'package:dram/constants.dart';
import 'package:dram/widgets/person.dart';
import 'package:flutter/material.dart';

class ChatsTab extends StatelessWidget {
  ChatsTab({super.key});
  List<Map<String, String>> persons = [
    {
      'name': 'Mahmoud Taha',
      'lastMsg': "Lorem ipsum",
      'lastTime': '12:00 pm',
    },
    {
      'name': 'Mahmoud Taha',
      'lastMsg': "Lorem ipsum",
      'lastTime': '11:00 pm',
    },
    {
      'name': 'Mahmoud Taha',
      'lastMsg': "Lorem ipsum",
      'lastTime': '9:49 am',
    },
    {
      'name': 'Mahmoud Taha',
      'lastMsg': "Typing...",
      'lastTime': '8:00 am',
    },
    {
      'name': 'Mahmoud Taha',
      'lastMsg': "Recording voice...",
      'lastTime': '9:30 am',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return
        // ListView(
        //   physics: const BouncingScrollPhysics(),
        //   children: [
        // ListTile(
        //   title: const Text(
        //     'Mahmoud Taha',
        //     style: TextStyle(
        //       fontSize: 15,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   subtitle: Text(
        //     'Lorem ipsum',
        //     style: TextStyle(
        //       color: Theme.of(context).hintColor,
        //     ),
        //   ),
        //   leading: CircleAvatar(
        //     radius: 30,
        //     backgroundImage: const AssetImage(kProfile),
        //     child: Container(
        //       decoration: const ShapeDecoration(
        //         shape: CircleBorder(eccentricity: 1),
        //       ),
        //       child: MaterialButton(
        //         onPressed: () {},
        //       ),
        //     ),
        //   ),
        //   trailing: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Text(
        //         '12:30 pm',
        //         style: TextStyle(
        //           color: Theme.of(context).hintColor,
        //           fontSize: 12,
        //         ),
        //       ),
        //       Transform.rotate(
        //         angle: 3.1415926535 / 4,
        //         child: Icon(
        //           Icons.push_pin,
        //           size: 20,
        //           color: Theme.of(context).hintColor,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: persons.length,
      itemBuilder: (BuildContext context, int index) {
        final item = persons[index];
        return Person(
          name: item['name'],
          lastMsg: item['lastMsg'],
          lastTime: item['lastTime'],
        );
      },
    );
    //   ],
    // );
  }
}
