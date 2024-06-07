import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/functions/check_palindrome.dart';
import 'package:suitmedia/providers/name_provider.dart';
import 'package:suitmedia/shared/theme.dart';
import 'package:suitmedia/widgets/custom_button.dart';
import 'package:suitmedia/widgets/custom_text_field.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    NameProvider nameProvider = Provider.of<NameProvider>(context);
    bool isPalindrome = false;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/background.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/add_photo.png",
                    width: 116,
                  ),
                ),
                const SizedBox(
                  height: 51,
                ),
                CustomTextField(controller: nameController, hint: "Name"),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    controller: palindromeController, hint: "Palindrome"),
                const SizedBox(
                  height: 42,
                ),
                CustomButton(
                    function: () {
                      isPalindrome = checkPalindrome(palindromeController.text);
                      if (isPalindrome) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: green,
                            content: const Text(
                              'isPalindrome',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color.fromARGB(255, 210, 72, 62),
                            content: Text(
                              'not palindrome',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    text: "CHECK"),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                    function: () {
                      nameProvider.setUser(nameController.text);
                      Navigator.pushNamed(context, '/second');
                    },
                    text: "NEXT"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
