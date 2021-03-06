import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/view/after_login_screens/chatting_screen.dart';

class ChatScreen extends StatelessWidget {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kf1f1f1,
      appBar: AppBar(
        shadowColor: AppColors.kb0b0b0,
        elevation: 5,
        backgroundColor: AppColors.kffffff,
        centerTitle: true,
        title: Text(
          "Chats",
          style: kInterText.copyWith(
            fontSize: 25,
            color: AppColors.kff4165,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/images/chat_search.png"),
                  color: AppColors.kd1d1d1,
                ),
              ))
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(ChattingScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.kffffff,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Charlie Orlando",
                            style: kInterText.copyWith(
                              fontSize: 17,
                              color: AppColors.k000000.withOpacity(0.9),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            "Hey there!.",
                            style: kInterText.copyWith(
                              fontSize: 15,
                              color: AppColors.k191919.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(
                            "${dateTime.hour}:${dateTime.minute < 10 ? '0${dateTime.minute}' : dateTime.minute} ",
                            style: kInterText.copyWith(
                              fontSize: 15,
                              color: AppColors.kD8D8D8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://via.placeholder.com/150")),
                          /*child: Image(
                            image: NetworkImage("https://via.placeholder.com/")),*/
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            );
          }),
    );
  }
}
