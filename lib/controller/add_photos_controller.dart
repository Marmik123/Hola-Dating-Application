import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotosController extends GetxController {
  File photo;
  final picker = ImagePicker();
  RxBool photoAdded = false.obs;
  List<dynamic> profileImage = [].obs;

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
    Get.dialog(AlertDialog(
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
  }

  //Function for choosing picture
  Future<void> pickProfilePicture(ImageSource source) async {
    print("#### Pick  Profile picture called");
    Get.back();
    final pickedFile = await picker.getImage(
      source: source,
    );
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      profileImage.add(photo);
      print(profileImage);
      photoAdded.value = true;
    } else {
      print('No image selected.');
    }
    update();
  }

  //Function to remove photo from the list
  void removePhoto(index) {
    profileImage.removeAt(index);
    update();
  }
}
