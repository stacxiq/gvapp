import 'package:get/get.dart';
import 'package:greenvilllage/models/message.dart';
import 'package:greenvilllage/repositories/chat_repository.dart';

class ChatController extends GetxController {
  RxList<MessageData> messageList = <MessageData>[].obs;

  Future<void> sendMessage(String message) async {
    final chatResponse = await chatRepository.sendMessage(message);

    chatResponse.fold(
      (failure) => print('Error: ${failure.message}'),
      (response) {
        messageList.add(MessageData(message, DateTime.now(), true));
      },
    );
  }

  fetchMessage() async {
    final messagesResponse = await chatRepository.getMessages();

    messagesResponse.fold((failure) => print('Error: ${failure.message}'),
        (response) {
      final messagesList = response.data['messages'];

      if ((messagesList as List).isNotEmpty) {
        for (var message in messagesList) {
          if (message['user_id'] != 1) {
            messageList.add(MessageData(message['message'],
                DateTime.parse(message['created_at']), true));
          } else {
            messageList.add(MessageData(message['message'],
                DateTime.parse(message['created_at']), false));
          }
        }
      }
    });
  }

  @override
  void onInit() {
    fetchMessage();
    super.onInit();
  }
}
