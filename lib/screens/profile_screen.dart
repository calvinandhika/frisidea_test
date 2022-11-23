import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/pp.png'),
            const SizedBox(height: 20),
            const Text(
              'Calvin Andhika',
              style: TextStyle(fontSize: 22),
            ),
            const Text(
              'calvin.andhika@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            customButton(
              text: 'Github',
              img: 'assets/img/github-logo.png',
              onTap: () {
                launchUrl(Uri.parse('https://github.com/calvinandhika'));
              },
            ),
            const SizedBox(height: 20),
            customButton(
              text: 'Linkedin',
              img: 'assets/img/linkedin-logo.png',
              onTap: () {
                launchUrl(
                    Uri.parse('https://www.linkedin.com/in/calvinandhika/'));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton({
    required String text,
    required String img,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade400,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(img, height: 50),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
