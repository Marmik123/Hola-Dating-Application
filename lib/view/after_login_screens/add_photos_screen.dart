import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/add_photos_controller.dart';

class AddPhotos extends StatelessWidget {
  AddPhotosController addPicCtrl = Get.put(AddPhotosController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.kf6f6f6,
      appBar: AppBar(
        shadowColor: AppColors.kb0b0b0,
        elevation: 5,
        backgroundColor: AppColors.kffffff,
        centerTitle: true,
        title: Text(
          "Add Photos",
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
              size: 18,
              color: AppColors.k000000,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder(
              init: AddPhotosController(),
              builder: (value) => GridView.builder(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                itemCount: addPicCtrl.profileImage.length + 1,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 10,
                  childAspectRatio: 104 / 126,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index < addPicCtrl.profileImage.length) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(addPicCtrl.profileImage[index]),
                        ),
                        Obx(
                          () => Positioned(
                            right: 0,
                            bottom: 5,
                            child: InkWell(
                              onTap: () {
                                addPicCtrl.removePhoto(index);
                              },
                              // addPicCtrl.profileImage.add()

                              child: Image(
                                height: 30,
                                width: 30,
                                image: addPicCtrl.photoAdded.value
                                    ? AssetImage(
                                        "assets/images/remove_photo.png")
                                    : AssetImage("assets/images/add_icon.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Stack(
                      overflow: Overflow.visible,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                          ),
                          onTap: () {
                            addPicCtrl.askImageSource();
                          },
                        ),
                        Positioned(
                          left: 80,
                          bottom: 5,
                          child: InkWell(
                            onTap: () {
                              addPicCtrl.askImageSource();
                              // addPicCtrl.profileImage.add()
                            },
                            child: Image(
                              height: 30,
                              width: 30,
                              image: AssetImage("assets/images/add_icon.png"),
                            ),
                          ),
                        ),
/*
                        Positioned(
                          child: FittedBox(
                            child: Text(
                              'Add Images',
                              style: kInterText.copyWith(
                                color: AppColors.kffffff.withOpacity(0.5),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          top: 50,
                        )
*/
                      ],
                    );
                  }
                },
              ),
            ),
            flatButton(
              txtSize: 17,
              buttonColor: AppColors.kff4165,
              txtColor: AppColors.kffffff,
              onTap: () {},
              buttonTxt: "Done",
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            )
          ],
        ),
      ),
    );
  }
}
