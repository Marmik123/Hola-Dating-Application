import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/profile_screen_controller.dart';
import 'package:hola/view/widgets/circular_loader.dart';

class BuildProfileScreen extends StatelessWidget {
  ProfileScreenController profileCtrl = Get.put(ProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  GetBuilder(
                    init: ProfileScreenController(),
                    builder: (value) => Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: AppColors.k666666.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset(0, 5),
                        ),
                      ]),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: profileCtrl.profilePicture == null
                            ? AssetImage("assets/images/Charlie.png")
                            : FileImage(profileCtrl.profilePicture),
                      ),
                    ),
                  ),
                  Positioned(
                    width: 50,
                    bottom: 0,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        profileCtrl.askImageSource();
                      },
                      child: Image(
                          image: AssetImage("assets/images/add_icon.png")),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Build Your Profile",
                style: kInterText.copyWith(
                  color: AppColors.kff4165,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hola is building real dating between real people. Atleast add one photo of yourself.",
                style: kInterText.copyWith(
                  color: AppColors.k000000,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 150,
              ),
              profileCtrl.isLoading.value
                  ? buildLoader()
                  : flatButton(
                      txtSize: 17,
                      buttonColor: AppColors.kff4165,
                      txtColor: AppColors.kffffff,
                      onTap: () {
                        profileCtrl.uploadPicture();
                      },
                      buttonTxt: "Add Your Photo",
                      padding: const EdgeInsets.symmetric(
                          vertical: 19, horizontal: 80),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
