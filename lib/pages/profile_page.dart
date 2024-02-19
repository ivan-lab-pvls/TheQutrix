import 'dart:convert';

import 'package:financial_app/model/user.dart';
import 'package:financial_app/pages/privacy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserItem user = UserItem();

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController textControllerUserName = TextEditingController();
  TextEditingController textControllerUseruserEmail = TextEditingController();
  bool isOn = false;
  @override
  void initState() {
    super.initState();
    getSP();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 65, bottom: 42, left: 16, right: 16),
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              height: 57,
              width: 57,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: const Color(0xfffaa69de), width: 2)),
              child: const Icon(
                Icons.person,
                color: Color(0xffffaa69de),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              user.name != null && user.name!.isNotEmpty
                  ? '${user.name}'
                  : 'UserName',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              user.userEmail != null && user.userEmail!.isNotEmpty
                  ? '${user.userEmail}'
                  : 'username@gmail.com',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF626262)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: InkWell(
              onTap: () {
                if (user.name != null) {
                  textControllerUserName.text = user.name!;
                }
                showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                          content: Card(
                            color: Colors.transparent,
                            elevation: 0.0,
                            child: Column(children: [
                              const Text('Enter your nickname',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  controller: textControllerUserName,
                                  decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: BorderSide(width: 1)),
                                      label: Text('Nickname ',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  controller: textControllerUseruserEmail,
                                  decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: BorderSide(width: 1)),
                                      label: Text('userEmail ',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500))),
                                ),
                              ),
                            ]),
                          ),
                          actions: [
                            Card(
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel',
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15))),
                                    InkWell(
                                        onTap: () {
                                          user.name =
                                              textControllerUserName.text;
                                          user.userEmail =
                                              textControllerUseruserEmail.text;
                                          addToSP(user);
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Save',
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15)))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ));
              },
              child: Container(
                  width: 178,
                  height: 34,
                  padding: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: const Color(0xfffaa69de),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Edit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const Redx(
                            linkxa: 'https://docs.google.com/document/d/1iuiMB21JKciYqML_KpCBcjJNj26F0SkXzXWySBhR8Bg/edit?usp=sharing',
                          )),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xFFf7f3fb),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset('assets/lock.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Privacy policy',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: InkWell(
              onTap: () {
                Share.share('Check best financial app. Download - https://apps.apple.com/us/app/the-quatrix-finance-app/id6478109047');
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xFFf7f3fb),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset('assets/link.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Share app',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: InkWell(
              onTap: () {
                final InAppReview inAppReview = InAppReview.instance;
                inAppReview.openStoreListing(appStoreId: '6478109047');
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xFFf7f3fb),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset('assets/like.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Rate app',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const Redx(
                            linkxa: 'https://docs.google.com/document/d/1jNpV1U62zgqfJWtxFRzct4wy11HROdQrXjgrHeDwt9c/edit?usp=sharing',
                          )),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xFFf7f3fb),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset('assets/info.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Terms o use',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> addToSP(UserItem? user) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    if (user != null) {
      prefs.setString('user', jsonEncode(user));
    }
  }

  void getSP() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      user = UserItem.fromJson(userMap);
    }
    setState(() {});
  }
}
