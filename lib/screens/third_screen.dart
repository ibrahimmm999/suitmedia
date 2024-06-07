import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/providers/user_provider.dart';
import 'package:suitmedia/shared/theme.dart';
import 'package:suitmedia/widgets/card_user.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    isloading = true;
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.getDataUsers();
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: purple,
              )),
          title: Text(
            "Third Screen",
            style: blackText.copyWith(fontSize: 18, fontWeight: semibold),
          ),
          centerTitle: true,
        ),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(
                color: purple,
              ))
            : ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                children: userProvider.listUser
                    .map((user) => GestureDetector(
                          onTap: () {
                            if (!userProvider.listSelectedUser.contains(user)) {
                              userProvider.selectUser(user);
                            } else {
                              userProvider.removeUser(user);
                            }
                          },
                          child: Stack(
                            children: [
                              CardUser(
                                user: user,
                              ),
                              Visibility(
                                visible: userProvider.listSelectedUser
                                    .contains(user),
                                child: Container(
                                  height: 77,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                      color: grey.withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius)),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ));
  }
}
