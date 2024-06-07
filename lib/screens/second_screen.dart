import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/providers/name_provider.dart';
import 'package:suitmedia/providers/user_provider.dart';
import 'package:suitmedia/shared/theme.dart';
import 'package:suitmedia/widgets/card_user.dart';
import 'package:suitmedia/widgets/custom_button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NameProvider nameProvider = Provider.of<NameProvider>(context);
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
          "Second Screen",
          style: blackText.copyWith(fontSize: 18, fontWeight: semibold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            children: [
              Text(
                "Welcome",
                style: blackText.copyWith(fontSize: 12, fontWeight: regular),
              ),
              Text(
                nameProvider.name.isEmpty ? "John Doe" : nameProvider.name,
                style: blackText.copyWith(fontSize: 18, fontWeight: semibold),
              ),
              Visibility(
                visible: userProvider.listSelectedUser.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Column(
                    children: userProvider.listSelectedUser
                        .map((user) => CardUser(
                              user: user,
                              isSecondScreen: true,
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
          Visibility(
              visible: userProvider.listSelectedUser.isEmpty,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Selected User Name",
                  style: blackText.copyWith(fontSize: 24, fontWeight: semibold),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  function: () {
                    Navigator.pushNamed(context, '/third');
                  },
                  text: "Choose a User"),
            ),
          ),
        ],
      ),
    );
  }
}
