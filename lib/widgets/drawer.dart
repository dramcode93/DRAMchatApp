import 'package:dram/constants.dart';
import 'package:dram/models/theme.dart';
import 'package:dram/widgets/drawer_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeProvider>().isDark;
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
            subtitle: Text(
              '+20 102 234 5678',
              style: TextStyle(
                color: Theme.of(context).hintColor,
              ),
            ),
            trailing: CircleAvatar(
              radius: 30,
              backgroundImage: const AssetImage(kProfile),
              child: Container(
                child: MaterialButton(
                  onPressed: () {},
                ),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                context.read<ThemeProvider>().toggleDarkMode();
              },
              icon: Transform.rotate(
                angle: 3.1415926535 / 4,
                child: Icon(
                  isDark ? Icons.sunny : Icons.mode_night,
                  // Icons.mode_night,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black54,
        ),
        DrawerRow(
          title: 'My Accounts',
          icon: Icon(
            Icons.person_outlined,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
        ),
        DrawerRow(
          title: 'New Group',
          icon: Icon(
            Icons.groups_2_outlined,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
        ),
        DrawerRow(
          title: 'Favourite Messages',
          icon: Icon(
            Icons.star_border,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
        ),
        DrawerRow(
          title: 'Notes',
          icon: Icon(
            Icons.note_alt_outlined,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
        ),
        DrawerRow(
          title: 'Devices',
          icon: Icon(
            Icons.devices_sharp,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
        ),
        DrawerRow(
          title: 'Setting',
          icon: Icon(
            Icons.settings,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
