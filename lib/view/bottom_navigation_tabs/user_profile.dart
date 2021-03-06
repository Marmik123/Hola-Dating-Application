import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/slug_screen_controller.dart';
import 'package:hola/controller/user_profile_controller.dart';
import 'package:hola/view/after_login_screens/edit_profile.dart';
import 'package:hola/view/delete_account.dart';
import 'package:hola/view/slug_screen/about_us.dart';
import 'package:hola/view/slug_screen/contact_us.dart';

class UserProfile extends StatelessWidget {
  UserProfileController userCtrl = Get.put(UserProfileController());
  SlugScreenController slugCtrl = Get.put(SlugScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kf6f6f6,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Charlie Orlando",
                      style: kInterText.copyWith(
                        fontSize: 17,
                        color: AppColors.k000000.withOpacity(0.9),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Image(
                        height: 14,
                        width: 14,
                        image: AssetImage("assets/images/arrow.png"))
                  ],
                ),
                subtitle: editProfileButton(
                    buttonTxt: "Edit Profile",
                    buttonColor: AppColors.kff4165,
                    txtColor: AppColors.kffffff,
                    onTap: () {
                      Get.to(EditProfile());
                    },
                    padding: EdgeInsets.fromLTRB(10, 6, 10, 6)),
                leading: CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage("https://via.placeholder.com/250")),
              ),
              SizedBox(
                height: 50,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Obx(() => Column(
                        children: [
                          ListTile(
                            leading: Image(
                                height: 36,
                                width: 36,
                                image: AssetImage(
                                    "assets/images/notification_icon.png")),
                            title: Text(
                              "Get Notifications",
                              style: kInterText.copyWith(
                                fontSize: 18,
                                color: AppColors.k000000.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: CupertinoSwitch(
                                activeColor: AppColors.k34c759,
                                value: userCtrl.notifyToggle.value,
                                onChanged: (value) {
                                  userCtrl.notifyToggle.value = value;
                                }),
                          ),
                          ListTile(
                            leading: Image(
                                height: 36,
                                width: 36,
                                image: AssetImage(
                                    "assets/images/location_icon.png")),
                            title: Text(
                              "Location",
                              style: kInterText.copyWith(
                                fontSize: 18,
                                color: AppColors.k000000.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: CupertinoSwitch(
                                activeColor: AppColors.k34c759,
                                value: userCtrl.loactionToggle.value,
                                onChanged: (value) {
                                  userCtrl.loactionToggle.value = value;
                                }),
                          ),
                          ListTile(
                            leading: Image(
                                height: 36,
                                width: 36,
                                image: AssetImage(
                                    "assets/images/acc_settings.png")),
                            title: Text(
                              "Account Setting",
                              style: kInterText.copyWith(
                                fontSize: 18,
                                color: AppColors.k000000.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Image(
                                height: 14,
                                width: 14,
                                image: AssetImage("assets/images/arrow.png")),
                          ),
                          ListTile(
                            leading: Image(
                                height: 36,
                                width: 36,
                                image:
                                    AssetImage("assets/images/linked_acc.png")),
                            title: Text(
                              "Linked Accounts",
                              style: kInterText.copyWith(
                                fontSize: 18,
                                color: AppColors.k000000.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Image(
                                height: 14,
                                width: 14,
                                image: AssetImage("assets/images/arrow.png")),
                          ),
                          ListTile(
                            onTap: () {
                              slugCtrl.loadContactUsSlug();
                              Get.to(ContactUs());
                            },
                            leading: Image(
                                height: 36,
                                width: 36,
                                image: AssetImage(
                                    "assets/images/help_center.png")),
                            title: Text(
                              "Help Center",
                              style: kInterText.copyWith(
                                fontSize: 18,
                                color: AppColors.k000000.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Image(
                                height: 14,
                                width: 14,
                                image: AssetImage("assets/images/arrow.png")),
                          ),
                          ListTile(
                            onTap: () {
                              slugCtrl.loadAboutUsSlug();
                              Get.to(AboutUs());
                            },
                            leading: Image(
                                height: 36,
                                width: 36,
                                image:
                                    AssetImage("assets/images/about_us.png")),
                            title: Text(
                              "About Us",
                              style: kInterText.copyWith(
                                fontSize: 18,
                                color: AppColors.k000000.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Image(
                                height: 14,
                                width: 14,
                                image: AssetImage("assets/images/arrow.png")),
                          ),
                          ListTile(
                            leading: Image(
                                height: 36,
                                width: 36,
                                image: AssetImage(
                                    "assets/images/logout_icon.png")),
                            title: Text(
                              "Logout",
                              style: kInterText.copyWith(
                                fontSize: 18,
                                color: AppColors.k000000.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Image(
                                height: 14,
                                width: 14,
                                image: AssetImage("assets/images/arrow.png")),
                          ),
                          ListTile(
                            leading: Image(
                                height: 36,
                                width: 36,
                                image:
                                    AssetImage("assets/images/delete_acc.png")),
                            title: Text(
                              "Delete Account",
                              style: kInterText.copyWith(
                                fontSize: 18,
                                color: AppColors.k000000.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Image(
                                height: 14,
                                width: 14,
                                image: AssetImage("assets/images/arrow.png")),
                            onTap: () {
                              Get.to(DeleteAccount());
                            },
                          )
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
