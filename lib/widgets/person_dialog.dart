import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? name;
  final String? image;

  const CustomAlertDialog({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBar = AppBar();
    final bodyHeight = screenHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return
        // SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        // padding: EdgeInsets.only(bottom: bodyHeight * 0.3),
        Stack(
      children: [
        Positioned(
          top: 120,
          left: (screenWidth-266)/2,
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: Border(),
            clipBehavior: Clip.none,
            iconPadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            insetPadding: EdgeInsets.all(0),
            actionsPadding: EdgeInsets.all(0),
            buttonPadding: EdgeInsets.all(0),
            content: SizedBox(
              // height: bodyHeight * 0.4,
              child: Column(
                children: [
                  Container(
                    height: 230,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          image!,
                        ),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        name!,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    color: Theme.of(context).backgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.chat_bubble)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.video_call)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // ),
        ),
      ],
    );
  }
}
