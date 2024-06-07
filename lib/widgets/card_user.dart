import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/models/user_model.dart';
import 'package:suitmedia/providers/user_provider.dart';
import 'package:suitmedia/shared/theme.dart';

class CardUser extends StatelessWidget {
  const CardUser({super.key, required this.user, this.isSecondScreen = false});
  final UserModel user;
  final bool isSecondScreen;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius), color: white),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.network(
                  user.avatar,
                  width: 49,
                  height: 49,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.firstName} ${user.lastName}",
                    style: blackText.copyWith(fontSize: 16, fontWeight: medium),
                  ),
                  Text(
                    user.email,
                    style: greyText.copyWith(fontSize: 10, fontWeight: medium),
                  )
                ],
              )
            ],
          ),
          Visibility(
            visible: isSecondScreen,
            child: IconButton(
                onPressed: () => userProvider.removeUser(user),
                icon: Icon(
                  Icons.delete,
                  color: red,
                )),
          )
        ],
      ),
    );
  }
}
