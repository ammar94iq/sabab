import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class States extends StatelessWidget {
  const States({super.key});

  @override
  Widget build(BuildContext context) {
    var posts = [
      {
        "id": '1',
        "title":
            "انا بحاجة ماسة الى التبرع بالكلية.اتمنى من الكرام بالتطبيق المساعدة والتبرع لي",
      },
      {
        "id": '2',
        "title":
            "صديقتي تعاني من مشاكل في القلب وتحتاج بشكل عاجل الى زرع قلب جديد",
      },
      {
        "id": '3',
        "title":
            "ابني يواجه صعوبات بالتنفس بسبب مشاكل في الرئة احتاج الى متبرع بالرئة",
      }
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 191, 225, 253).withOpacity(0.4),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Image.asset(
                'images/logo.png',
                height: MediaQuery.of(context).size.width / 3.0,
                width: MediaQuery.of(context).size.width / 3.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'الحالات',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 50.0);
                  },
                  shrinkWrap: true,
                  itemCount: posts.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        const Expanded(
                          child: Column(
                            children: [
                              Icon(Icons.person, size: 100.0),
                              Text("مستخدم جديد"),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  posts[index]['title'].toString(),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              const Row(
                                children: [
                                  Expanded(
                                    child: ShareState(),
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    child: ContactUserButton(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  const Expanded(
                                    child: OpenChat(),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: CopyLinkButton(
                                        id: posts[index]['id'].toString()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareState extends StatelessWidget {
  const ShareState({super.key});

  @override
  Widget build(BuildContext context) {
    String state = "state now";
    final Uri _url = Uri.parse('whatsapp://send?text=$state');

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return InkWell(
      onTap: _launchUrl,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text('نشر الحالة'),
      ),
    );
  }
}

class OpenChat extends StatelessWidget {
  const OpenChat({super.key});

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "+9647748114436";
    final Uri _url = Uri.parse('whatsapp://send?phone=$phoneNumber');

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return InkWell(
      onTap: _launchUrl,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text('الدردشة'),
      ),
    );
  }
}

class ContactUserButton extends StatelessWidget {
  const ContactUserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showPhoneNumberDialog(context, "0785643246");
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 99, 221, 243).withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text('تواصل مع المستخدم'),
      ),
    );
  }

  void _showPhoneNumberDialog(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('رقم الهاتف'),
          content: Text(phoneNumber),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}

class CopyLinkButton extends StatelessWidget {
  final String id;
  const CopyLinkButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showCopyLinkDialog(context, "https://example.com/?id=$id");
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 245, 111).withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text('نسخ الرابط'),
      ),
    );
  }

  void _showCopyLinkDialog(BuildContext context, String link) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('نسخ الرابط'),
          content: Text(link),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}
