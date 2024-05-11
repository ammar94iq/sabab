import 'package:flutter/material.dart';

import 'login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:
                const Color.fromARGB(255, 191, 225, 253).withOpacity(0.4),
          ),
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
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
                  "خليك سبب",
                  style: TextStyle(fontSize: 25.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "وَمَنْ أَحْيَاهَا فَكَأَنَّمَا أَحْيَا النَّاسَ جَمِيعاً ",
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(0.5),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) {
                          return const Login();
                        }),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'دخول',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
