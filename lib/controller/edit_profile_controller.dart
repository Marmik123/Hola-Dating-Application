import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  DateTime selectedDate = DateTime.now();
  DateTime date;
  DateTime month;
  DateTime year;
  RxInt gender = 0.obs;
  File photo;

  final picker = ImagePicker();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    update();
  }

  /*Function that invokes and asks for the source to select a profile picture
  either from camera or gallery*/
  void askImageSource() {
    print("called image source");
    showDialog(
        context: Get.context,
        builder: (BuildContext context) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            backgroundColor: AppColors.kf6f6f6,
            title: Text(
              "Choose a photo from",
              style: kInterText.copyWith(
                color: AppColors.k000000.withOpacity(0.9),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    pickProfilePicture(ImageSource.camera);
                  },
                  leading: Icon(
                    Icons.camera_alt,
                    color: AppColors.kB5B5B5,
                  ),
                  title: Text('Camera',
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.kff4165,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                ListTile(
                  onTap: () {
                    pickProfilePicture(ImageSource.gallery);
                  },
                  leading: Icon(
                    Icons.image_outlined,
                    color: AppColors.kB5B5B5,
                  ),
                  title: Text('Gallery',
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.kff4165,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ],
            )));
    update();
  }

  //Function for Date Picker for editing birthday
  Future selectDate(BuildContext context) async {
    final DateTime pickedDate = await showRoundedDatePicker(
        height: MediaQuery.of(context).size.height / 3,
        context: context,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialDate: DateTime(DateTime.now().year - 18),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year - 18));
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
    }
  }

  //Function for choosing picture
  Future<void> pickProfilePicture(ImageSource source) async {
    Get.back();
    final pickedFile = await picker.getImage(
      source: source,
    );
    if (pickedFile != null) {
      photo = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
  }

  //Function that call the dialog for editing gender information
  void changeGender() {
    showDialog(
        context: Get.context,
        builder: (BuildContext context) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            backgroundColor: AppColors.kf6f6f6,
            title: Text(
              "Select a gender",
              style: kInterText.copyWith(
                color: AppColors.k000000.withOpacity(0.9),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    gender.value = 0;
                    Get.back();
                  },
                  title: Text('Male',
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.kff4165,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                ListTile(
                  onTap: () {
                    gender.value = 1;
                    Get.back();
                  },
                  title: Text('Female',
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.kff4165,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ],
            )));
  }
}
