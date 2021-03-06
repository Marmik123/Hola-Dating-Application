import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';

class MatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "You and Charlie have similar minds",
                  style: kInterText.copyWith(
                    fontSize: 19,
                    color: AppColors.kD8D8D8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    overflow: Overflow.visible,
                    children: [
                      CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              NetworkImage("https://via.placeholder.com/150")),
                      Positioned(
                        left: 80,
                        height: 120,
                        child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                "https://via.placeholder.com/150")),
                      ),
                      Positioned(
                        width: 60,
                        bottom: 90,
                        right: 80,
                        child: Image(
                          image:
                              AssetImage("assets/images/heart_match_cross.png"),
                        ),
                      ),
                      Positioned(
                        width: 80,
                        top: 80,
                        left: 130,
                        child: Image(
                          image: AssetImage("assets/images/heart_match.png"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: flatButton(
                    buttonTxt: "Send a message",
                    txtSize: 17,
                    buttonColor: AppColors.kff4165,
                    txtColor: AppColors.kffffff,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 72, vertical: 20),
                    onTap: () {}),
              ),
              flatButton(
                  buttonTxt: "Cancel",
                  txtSize: 17,
                  buttonColor: AppColors.kffffff,
                  txtColor: AppColors.k000000,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 62, vertical: 20),
                  onTap: () {
                    Get.back();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
