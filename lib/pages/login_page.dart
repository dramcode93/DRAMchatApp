import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'LogIn Your Account',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                  height: 150, child: Image.asset('assets/images/logo.png')),
              Center(
                child: const Text(
                  'DRAMChat',
                  style: TextStyle(
                    fontSize: 28,
                    color: Color(0xff322653),
                  ),
                ),
              ),
              SizedBox(
                height: 110,
              ),
              const Row(
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Phone Number',
                onChanged: (String) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Password',
                onChanged: (String) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomBtn(
                btnText: 'LOGIN',
                onTap: () {},
                btnColor: Color(0xff322653),
                txtColor: Colors.white,
              ),
              // Padding(
              //   padding: EdgeInsets.all(12.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'dont\'t have an account ?',
              //         style: TextStyle(color: Colors.white),
              //       ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(context, Register.id);
              //   },
              //   child: Text(
              //     '    Register',
              //     style: TextStyle(color: Color(0xffC7EDE6)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
