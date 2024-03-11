import 'package:dram/widgets/drawer_row.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListTile(
            title: const Text(
              'Mahmoud Taha',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              '+20 102 234 5678',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: CircleAvatar(
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
            leading: IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: 3.1415926535 / 4,
                child: const Icon(
                  Icons.mode_night,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black54,
        ),
        const DrawerRow(
          title: 'My Accounts',
          icon: Icon(
            Icons.person_outlined,
            size: 28,
          ),
        ),
        const DrawerRow(
          title: 'New Group',
          icon: Icon(
            Icons.groups_2_outlined,
            size: 28,
          ),
        ),
        const DrawerRow(
          title: 'Favourite Messages',
          icon: Icon(
            Icons.star_border,
            size: 28,
          ),
        ),
        const DrawerRow(
          title: 'Notes',
          icon: Icon(
            Icons.note_alt_outlined,
            size: 28,
          ),
        ),
        const DrawerRow(
          title: 'Devices',
          icon: Icon(
            Icons.devices_sharp,
            size: 28,
          ),
        ),
        const DrawerRow(
          title: 'Setting',
          icon: Icon(
            Icons.settings,
            size: 28,
          ),
        ),
      ],
    );
  }
}
