import 'package:dram/widgets/person.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class ChatsTab extends StatefulWidget {
  ChatsTab({super.key});

  @override
  State<ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
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

  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> userList = data['data'];
      setState(() {
        users = userList.map((json) => User.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

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
      // itemCount: persons.length,
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        // final item = persons[index];
        return Person(
          // name: item['name'],
          // lastMsg: item['lastMsg'],
          // lastTime: item['lastTime'],
          name: '${users[index].firstName} ${users[index].lastName}',
          lastMsg: '${users[index].email}',
          lastTime: '12:00',
          image: '${users[index].avatar}',
        );
      },
    ); 
    //   ],
    // );
  }
}
