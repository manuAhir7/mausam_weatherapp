// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const linkd = 'https://www.linkedin.com/in/manu-ahirwar-6b3261222';
    const source = 'https://github.com/manuAhir7/mausam_weatherapp';
    const issue = 'https://github.com/manuAhir7/mausam_weatherapp/issues';
    const policy =
        'https://blogoasisinternship.blogspot.com/2023/05/mausam-weather-app.html';
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Manu Ahirwar",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            accountEmail: const Text("contactdevelopermanu@gmail.com",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            currentAccountPicture: GestureDetector(
              onTap: () => showSecondImage(context),
              child: Hero(
                tag: 'my-hero-tag',
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'images/avatar.jpg',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.cyan,
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: const Icon(
              Icons.insert_link_outlined,
              color: Colors.cyan,
              size: 30,
            ),
            title: const Text('Follow me',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              final Uri url1 = Uri.parse(linkd);
              launchUrl(url1, mode: LaunchMode.platformDefault);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: Colors.cyan,
              size: 30,
            ),
            title: const Text('Share',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              Share.shareWithResult(
                  'Check out my amazing Mausam ⛅ weather app  - Download Now from Playstore');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.code_outlined,
              color: Colors.cyan,
              size: 30,
            ),
            title: const Text('Source code',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              final Uri url1 = Uri.parse(source);
              launchUrl(url1, mode: LaunchMode.platformDefault);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.bug_report_outlined,
              color: Colors.cyan,
              size: 30,
            ),
            title: const Text('Report a bug',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              final Uri url1 = Uri.parse(issue);
              launchUrl(url1, mode: LaunchMode.platformDefault);
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(
              Icons.description,
              color: Colors.cyan,
              size: 30,
            ),
            title: const Text('Policies',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              final Uri url1 = Uri.parse(policy);
              launchUrl(url1, mode: LaunchMode.platformDefault);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Colors.cyan,
              size: 30,
            ),
            title: const Text('About app',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      elevation: 4,
                      title: const Text("Mausam ️⛅ v1.0",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.cyan)),
                      content: const Text(
                        "Welcome to Mausam, your ultimate weather companion!. Mausam brings you accurate and up-to-date weather information right at your fingertips. "
                        "Mausam is designed to be your go-to weather companion, providing you with the essential information you need to make informed decisions and stay ahead of the elements. "
                        "Download Mausam today and never let the weather catch you off guard again.",
                        style: TextStyle(color: Colors.grey),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("ok",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.cyan)),
                        ),
                      ],
                    );
                  });
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            title: const Text('Exit',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.cyan,
              size: 30,
            ),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}

void showSecondImage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Scaffold(
            backgroundColor: Colors.black38,
            appBar: AppBar(
              title: const Text("User Image"),
              backgroundColor: Colors.black,
            ),
            body: Center(
              child: Hero(
                tag: 'my-hero-tag',
                child: Image.asset('images/avatar.jpg'),
              ),
            ),
          )));
}
