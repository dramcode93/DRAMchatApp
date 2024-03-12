import 'package:dram/constants.dart';
import 'package:flutter/material.dart';

class CallTap extends StatelessWidget {
  final List<Map<String, dynamic>> callData = [
    {
      'name': 'Dina Rashid',
      'call': Icons.call_made,
      'lastCallTime': "12:30 PM",
      'callType': 'incoming call',
      'iconData': Icons.call_received,
    },
    {
      'name': 'Rawan Mamdouh',
      'call': Icons.call_made,
      'lastCallTime': "4:45 PM",
      'callType': 'outgoing call',
      'iconData': Icons.call_made,
    },
    {
      'name': 'Mahmoud Taha',
      'call': Icons.call_made,
      'lastCallTime': "11:00 AM",
      'callType': 'missed call',
      'iconData': Icons.call_missed,
    },
    // Add more call data maps as needed
  ];

  CallTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: callData.length,
      itemBuilder: (BuildContext context, int index) {
        final item = callData[index];
        return ListTile(
          title: Text(
            item['name'],
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(item['call'], color: Theme.of(context).hintColor),
              Text(
                item['callType'],
                style:  TextStyle(
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          ),
          leading: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(kProfile),
          ),
          trailing: SizedBox(
            width: 90, // Adjust the width as needed
            child: Row(
              // mainAxisSize: MainAxisSize.min, // Use minimal space
              children: [
                Expanded(
                  child: Text(
                    item['lastCallTime'],
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CircleAvatar(
                  radius: 15, // Adjusted for space
                  backgroundColor: const Color.fromARGB(255, 199, 198, 198),
                  child: Icon(
                    item['iconData'],
                    color: item['callType'] == 'missed call'
                        ? Colors.red
                        : Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
