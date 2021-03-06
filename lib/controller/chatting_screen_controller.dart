import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/model/message.dart';
import 'package:hola/repository/message_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ChattingScreenController extends GetxController {
  RxList<dynamic> messageList = [].obs;
  final messageTextController = TextEditingController();
  RxBool isMe = true.obs;
  String message;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    handleLiveQuery();
    MessageRepository.loadAllMessages().then((value) {
      messageList.addAll(value);
    });
  }

  Future<ParseUser> currentUser() async {
    return await ParseUser.currentUser();
  }

  void handleLiveQuery() async {
    final LiveQuery liveQuery = LiveQuery(debug: true);
    QueryBuilder<Message> query = QueryBuilder<Message>(Message());
    print('LiveQueryURL ${ParseCoreData().liveQueryURL}');

    Subscription subscription = await liveQuery.client.subscribe(query);
    subscription.on(LiveQueryEvent.create, (value) {
      print("CREATE ${DateTime.now().toString()} \n $value");
      Message m = Message.clone().fromJson(jsonDecode(value.toString()));

      messageList.add(m);
      update();
    });

    subscription.on(LiveQueryEvent.update, (value) {
      print('*** UPDATE ***: ${DateTime.now().toString()}\n $value ');
    });

    subscription.on(LiveQueryEvent.delete, (value) {
      print('*** DELETE ***: ${DateTime.now().toString()}\n $value ');
    });

    print('Subscribe done');
  }
}
