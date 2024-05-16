import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/chat_controllers.dart';
import 'package:greenvilllage/pages/chat/widgets/receiver_row_view.dart';
import 'package:greenvilllage/pages/chat/widgets/sender_widget.dart';
import 'package:intl/intl.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.find<ChatController>();

    return Obx(
      () => ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        itemCount: chatController.messageList.length,
        itemBuilder: (context, index) =>
            (chatController.messageList[index].isSender)
                ? SenderRowView(
                    senderMessage: chatController.messageList[index].message,
                    date: DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY)
                        .format(chatController.messageList[index].dateTime),
                  )
                : ReceiverRowView(
                    receiverMessage: chatController.messageList[index].message),
      ),
    );
  }
}
