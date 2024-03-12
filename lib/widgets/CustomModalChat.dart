import 'package:flutter/material.dart';

class CustomModalChat extends StatelessWidget {
  const CustomModalChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.remove,
              size: 32,
              // color: Theme.of(context).hintColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModalRow(
                    title: 'Pin Chat',
                    icon: Icon(
                      Icons.push_pin,
                      size: 32,
                      color: Theme.of(context).primaryColor,
                    ),
                    degree: 3.1415926535 / 4,
                  ),
                  ModalRow(
                    title: 'UnRead',
                    icon: Icon(
                      Icons.mark_unread_chat_alt_outlined,
                      size: 32,
                      color: Theme.of(context).primaryColor,
                    ),
                    degree: 0,
                  ),
                  ModalRow(
                    title: 'Mute',
                    icon: Icon(
                      Icons.notifications_off,
                      size: 32,
                      color: Theme.of(context).primaryColor,
                    ),
                    degree: 0,
                  ),
                  const ModalRow(
                    title: 'Delete',
                    icon: Icon(
                      Icons.delete,
                      size: 32,
                      color: Colors.red,
                    ),
                    degree: 0,
                    color: Colors.red,
                  ),
                  const ModalRow(
                    title: 'Block',
                    icon: Icon(
                      Icons.block,
                      size: 32,
                      color: Colors.red,
                    ),
                    degree: 0,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModalRow extends StatelessWidget {
  const ModalRow({
    super.key,
    required this.title,
    required this.icon,
    required this.degree,
    this.color =const Color(0xff322653),
  });

  final String? title;
  final double? degree;
  final Icon? icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Transform.rotate(
            angle: degree!,
            child: icon,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title!,
            style: TextStyle(
              color: color,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
