import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/add_photos_controller.dart';
import 'package:hola/controller/edit_profile_controller.dart';
import 'package:hola/view/after_login_screens/add_photos_screen.dart';

class EditProfile extends StatelessWidget {
  AddPhotosController addPicCtrl = Get.put(AddPhotosController());
  EditProfileController editCtrl = Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            shadowColor: AppColors.kb0b0b0,
            elevation: 5,
            backgroundColor: AppColors.kffffff,
            centerTitle: true,
            title: Text(
              "Edit Profile",
              style: kInterText.copyWith(
                fontSize: 25,
                color: AppColors.kff4165,
                fontWeight: FontWeight.w700,
              ),
            ),
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.keyboard_backspace_sharp,
                  size: 19,
                  color: AppColors.k000000,
                )),
            actions: [
              InkWell(
                onTap: () {},
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "Done",
                      style: kInterText.copyWith(
                        color: AppColors.k000000.withOpacity(0.9),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                GetBuilder(
                  init: EditProfileController(),
                  builder: (value) => Stack(
                    alignment: Alignment.center,
                    overflow: Overflow.visible,
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 80, bottom: 50, left: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                editProfileRow("Name", "Bobby Brown", context,
                                    TextInputType.text, ""),
                                Divider(
                                  color: AppColors.kD8D8D8,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                editProfileRow("Email", "Bobby.brown@email.com",
                                    context, TextInputType.emailAddress, ""),
                                Divider(
                                  color: AppColors.kD8D8D8,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                editProfileRow("Phone", "000 0000 000", context,
                                    TextInputType.number, "+91"),
                                Divider(
                                  color: AppColors.kD8D8D8,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Obx(() => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Gender",
                                            style: kInterText.copyWith(
                                              fontSize: 18,
                                              color: AppColors.kd1d1d1
                                                  .withOpacity(0.9),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            child: TextFormField(
                                              style: kInterText.copyWith(
                                                fontSize: 18,
                                                color: AppColors.k000000
                                                    .withOpacity(0.9),
                                                fontWeight: FontWeight.w600,
                                              ),
                                              onTap: () {
                                                editCtrl.changeGender();
                                              },
                                              readOnly: true,
                                              textAlign: TextAlign.start,
                                              cursorColor: AppColors.kff4165,
                                              decoration: InputDecoration(
                                                hintText:
                                                    editCtrl.gender.value == 0
                                                        ? "Male"
                                                        : "Female",
                                                hintStyle: kInterText.copyWith(
                                                  fontSize: 18,
                                                  color: AppColors.k000000
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                filled: true,
                                                fillColor: AppColors.kffffff,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppColors.kffffff),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Divider(
                                  color: AppColors.kD8D8D8,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Date of Birth",
                                        style: kInterText.copyWith(
                                          fontSize: 18,
                                          color: AppColors.kd1d1d1
                                              .withOpacity(0.9),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.6,
                                        child: TextFormField(
                                          onTap: () {
                                            editCtrl.selectDate(context);
                                          },
                                          textAlign: TextAlign.start,
                                          cursorColor: AppColors.kff4165,
                                          decoration: InputDecoration(
                                            hintText:
                                                "${editCtrl.selectedDate.day}/${editCtrl.selectedDate.month}/${editCtrl.selectedDate.year}",
                                            hintStyle: kInterText.copyWith(
                                              fontSize: 18,
                                              color: AppColors.k000000
                                                  .withOpacity(0.9),
                                              fontWeight: FontWeight.w600,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            filled: true,
                                            fillColor: AppColors.kffffff,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.kffffff),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        bottom: 430,
                        child: Container(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: AppColors.k666666.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 5),
                            ),
                          ]),
                          child: GetBuilder(
                              init: AddPhotosController(),
                              builder: (value) => CircleAvatar(
                                  radius: 80,
                                  backgroundImage: addPicCtrl
                                          .profileImage.isEmpty
                                      ? AssetImage("assets/images/Charlie.png")
                                      : FileImage(addPicCtrl.profileImage[0]))),
                        ),
                      ),
                      Positioned(
                        width: 41,
                        bottom: 430,
                        right: 100,
                        child: InkWell(
                          onTap: () {
                            Get.to(AddPhotos());
                          },
                          child: Image(
                              image: AssetImage("assets/images/add_icon.png")),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
