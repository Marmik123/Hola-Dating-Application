import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/chatting_screen_controller.dart';
import 'package:hola/repository/message_repository.dart';

class ChattingScreen extends StatelessWidget {
  ChattingScreenController chatCtrl = Get.put(ChattingScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.kf6f6f6,
          appBar: AppBar(
            shadowColor: AppColors.kb0b0b0,
            elevation: 5,
            backgroundColor: AppColors.kffffff,
            centerTitle: true,
            title: Text(
              "Charlie",
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
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.separated(
                    reverse: true,
                    itemCount: chatCtrl.messageList?.length ?? 0,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: chatCtrl.isMe.value
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          !chatCtrl.isMe.value
                              ? CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      "https://via.placeholder.com/150"))
                              : Container(),
                          SizedBox(
                            width: 10,
                          ),
                          messageBox(
                            padding: EdgeInsets.all(10),
                            message: chatCtrl.messageList[index].message ?? '',
                            txtColor: chatCtrl.isMe.value
                                ? AppColors.kffffff
                                : AppColors.k000000,
                            buttonColor: chatCtrl.isMe.value
                                ? AppColors.kff4165
                                : AppColors.kffffff,
                            borderRadius: chatCtrl.isMe.value
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(22),
                                    topRight: Radius.circular(22),
                                    bottomLeft: Radius.circular(22))
                                : BorderRadius.only(
                                    topRight: Radius.circular(22),
                                    bottomRight: Radius.circular(22),
                                    bottomLeft: Radius.circular(22)),
                          ), //messagenBox
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      height: 1,
                      color: Colors.white12,
                    ),
                    shrinkWrap: true,
                  ),
                ),
                Container(
                  child: ListTile(
                    leading: InkWell(
                        onTap: () {},
                        child: Image(
                            height: 20,
                            width: 20,
                            image: AssetImage("assets/images/attach.png"))),
                    trailing: InkWell(
                        onTap: () {
                          //Send Functionality
                          MessageRepository.sendMessage(
                              message: chatCtrl.messageTextController.text);
                          chatCtrl.messageTextController.clear();
                        },
                        child: Image(
                            height: 31,
                            width: 31,
                            image: AssetImage("assets/images/send_messg.png"))),
                    title: TextFormField(
                      onChanged: (value) {
                        chatCtrl.message = value;
                      },
                      controller: chatCtrl.messageTextController,
                      cursorColor: AppColors.kff4165,
                      style: kInterText.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.k000000.withOpacity(0.9),
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: AppColors.kffffff,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kffffff,
                    borderRadius: BorderRadius.circular(31),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
