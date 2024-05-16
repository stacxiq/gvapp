import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/chat_controllers.dart';
import 'package:greenvilllage/pages/chat/widgets/chat_listview.dart';

class MyChatApp extends StatefulWidget {
  const MyChatApp({Key? key}) : super(key: key);

  @override
  MyChatAppState createState() => MyChatAppState();
}

class MyChatAppState extends State<MyChatApp> {
  TextEditingController textEditingController = TextEditingController();
  late String senderMessage, receiverMessage;
  ScrollController scrollController = ScrollController();

  Future<void> scrollAnimation() async {
    return await Future.delayed(
      const Duration(milliseconds: 100),
      () => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      backgroundColor: const Color(0xFF4D5482),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4D5482),
        leadingWidth: 50.0,
        titleSpacing: -8.0,
        leading: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFF90C953),
            child: Text(
              'GV',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        title: const ListTile(
          title: Text('Greenvillage',
              style: TextStyle(
                color: Colors.white,
              )),
          subtitle: Text('الدعم الفني',
              style: TextStyle(
                color: Colors.white70,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_forward_ios)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ChatListView(scrollController: scrollController)),
          Container(
            // height: 50,
            margin: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFF333D56),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 12.0),
                  child: const SizedBox(),
                ),
                Expanded(
                  child: TextFormField(
                    controller: textEditingController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 6,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'اكتب رسالتك هنا',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 11.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        chatController
                            .sendMessage(textEditingController.text)
                            .then((value) {
                          textEditingController.clear();
                          scrollAnimation();
                        });
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
