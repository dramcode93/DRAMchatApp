import 'package:dram/widgets/chats_tab.dart';
import 'package:dram/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();
  List<Widget> tabs = [
    const ChatsTab(),
    const Center(child: Text('story', style: TextStyle(fontSize: 25))),
    const Center(child: Text('call', style: TextStyle(fontSize: 25))),
  ];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: const Drawer(
          child: DrawerContent(),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
              _pageController.jumpToPage(value);
            });
          },
          backgroundColor: const Color(0xff322653),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          selectedFontSize: 16,
          unselectedFontSize: 16,
          iconSize: 26,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,
              ),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_outlined,
              ),
              label: 'Story',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
              ),
              label: 'Call',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xff322653),
        automaticallyImplyLeading: false,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                  Container(
                    width: 220,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '',
                          hintStyle: const TextStyle(
                            color: Color(0xff322653),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xff322653),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          )),
                    ),
                  ),
                  Transform.rotate(
                    angle: 3.1415926535,
                    child: IconButton(
                      icon: const Icon(
                        // Icons.menu_rounded,
                        Icons.toc_rounded,
                        size: 35,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: tabs,
      ),
    );
  }
}
