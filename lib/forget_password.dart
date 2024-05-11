import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: MediaQuery.of(context).size.width / 3.0,
                  width: MediaQuery.of(context).size.width / 3.0,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "اعادة تعيين كلمة المرور",
                  style: TextStyle(fontSize: 25.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "ادخل بريدك الالكتروني لارسال رمز التحقق",
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: "admin@gmail.com",
                    fillColor: Colors.grey.withOpacity(0.4),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'ارسال',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
