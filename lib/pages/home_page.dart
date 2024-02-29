import 'package:dram/generated/l10n.dart';
import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/navigate.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedValue ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Color(0xff322653),
            ],
            stops: [0.2, 0.8],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 220,
                width: 220,
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBtn(
                  // btnText: 'SignUp',
                    btnText: S
                        .of(context)
                        .SignUp,
                    btnColor: const Color.fromARGB(255, 252, 248, 248),
                    txtColor: const Color(0xff322653),
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   NumberPage.id,
                      // );
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          page: const NumberPage(),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomBtn(
                  // btnText: '  LogIn ',
                    btnText: S
                        .of(context)
                        .Login,
                    btnColor: const Color.fromARGB(255, 252, 248, 248),
                    txtColor: const Color(0xff322653),
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   LoginPage.id,
                      // );

                      Navigator.push(
                        context,
                        CustomPageRoute(
                          page: const LoginPage(),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10,),
                // PopupMenuButton<String>(
                //   color: Color(0xffBFBEBD),
                //   initialValue: selectedValue,
                //   icon: Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
                //   itemBuilder: (BuildContext context) {
                //     return ['Arabic', 'English'].map((String value) {
                //       return PopupMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(color: Colors.white, fontSize: 16),
                //         ),
                //       );
                //     }).toList();
                //   },
                //   onSelected: (String? newValue) {
                //     setState(() {
                //       selectedValue = newValue;
                //     });
                //     _switchLanguage(newValue);
                //   },
                // )

    Container(height: 100,
      child: DropdownButton<String>(
        dropdownColor: const Color(0xffBFBEBD),

      hint: const Padding(
        padding:  EdgeInsets.only(right:9.0),
        child: Text('Select Language',style: TextStyle(fontSize: 16,color:  Colors.white),),
      ),

      value: selectedValue,
      icon: const Icon(Icons.arrow_drop_down_outlined,color: Colors.white,),

      iconSize: 32,
      elevation: 16,

      underline: Container(

        height: 2,
        color: const Color(0xff000014),

      ),
      onChanged: (String? newValue) {
      setState(() {
      selectedValue = newValue;
      });
      _switchLanguage(newValue);
      },
      items: <String>['Arabic' , 'English']
          .map<DropdownMenuItem<String>>((String value) {

      return DropdownMenuItem<String>(

      value: value,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Text(value,style: const TextStyle(color: Colors.white, // Change color to whatever you want
        fontSize: 16, ),),
      ),
      );
      }).toList(),
      // isExpanded: true,


      ),
    ),
  ]




            ),
          ],
        ),
      ),
    );
  }
void _switchLanguage(String? languageCode) {
  Locale locale;
  switch (languageCode) {
    case 'Arabic':
      locale = const Locale('ar', 'AR');
      break;
    case 'English':
    default:
      locale =const  Locale('en', 'US');
  }
  // Set the new locale
  S.load(locale);
  setState(() {});
}

}
