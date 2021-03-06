import 'dart:io';

import 'package:dio/dio.dart' as multipart;
import 'package:dio/src/form_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:hola/api/api_routes.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/phone_no_controller.dart';
import 'package:hola/repository/profile_repository.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class ProfileScreenController extends GetxController {
  PhoneNoController ctrl = Get.put(PhoneNoController());
  File profilePicture;
  final picker = ImagePicker();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    update();
  }

  /*Function that invokes and asks for the source to select a profile picture
  either from camera or gallery*/
  void askImageSource() {
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
          )),
    );
    print("called image source");
  }

  //Function for choosing picture
  Future<void> pickProfilePicture(ImageSource source) async {
    Get.back();

    final pickedFile = await picker.getImage(source: source, imageQuality: 50);
    // profilePicture = File(pickedFile.path);
    if (pickedFile != null) {
      profilePicture = File(pickedFile.path);
      print(profilePicture);
    } else {
      print('No image selected.');
    }
    update();
  }

  Future<void> uploadPicture() async {
    // List<int> pictureBytes = profilePicture.readAsBytesSync();
    // String base64Image = base64Encode(pictureBytes);
    // print("}}}}}}}}}+ ${multipart.MultipartFile.fromFileSync(
    //   profilePicture.path,
    //   contentType: MediaType('image', '*'),
    //   filename: p.basename(profilePicture.path.toString()),
    // )}");
    isLoading.value = true;
    try {
      if (profilePicture != null) {
        var getFile = await API.getFileName(FormData.fromMap({
          "image": multipart.MultipartFile.fromFileSync(
            profilePicture.path,
            contentType: MediaType('image', '*'),
            filename: p.basename(profilePicture.path),
          )
        }));

        var uploadProfile = <String, dynamic>{
          "mobile_number": "7990126072",
          "profile_pic": getFile.data['file'],
        };
        if (getFile.statusCode == 200) {
          var response = await API
              .uploadProfilePictureApi(FormData.fromMap(uploadProfile));

          if (response.statusCode == 200) {
            print(response.data);
            pageController.nextPage(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInSine);
            isLoading.value = false;
          }
        }
      }
    } catch (e) {
      print(e);
      print("Error occured ,try again");
    }
  }
}
