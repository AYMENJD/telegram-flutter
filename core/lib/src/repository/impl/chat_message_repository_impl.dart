import 'package:jugger/jugger.dart' as j;
import 'package:tdlib/td_api.dart' as td;
import 'package:core/src/repository/chat_message_repository.dart';
import 'package:td_client/td_client.dart';
import 'package:rxdart/rxdart.dart';

class ChatMessageRepositoryImpl implements IChatMessageRepository {
  @j.inject
  ChatMessageRepositoryImpl(this._client);

  final TdClient _client;

  @override
  Stream<List<td.Message>> getMessages(
      {required int chatId, required int fromMessageId, required int limit}) {
    return _getMessages(
            chatId: chatId, fromMessageId: fromMessageId, limit: limit)
        .flatMap((List<td.Message> messages) {
      if (messages.isNotEmpty && messages.length != limit) {
        return _getMessages(
                chatId: chatId, fromMessageId: fromMessageId, limit: limit)
            .map((List<td.Message> additionalMessages) =>
                messages..addAll(additionalMessages));
      }

      return Stream<List<td.Message>>.value(messages);
    });
  }

  Stream<List<td.Message>> _getMessages(
          {required int chatId,
          required int fromMessageId,
          required int limit}) =>
      _client
          .sendFunction<td.Messages>(td.GetChatHistory(
              chatId: chatId,
              fromMessageId: fromMessageId,
              offset: 0,
              limit: limit,
              onlyLocal: false))
          .map((td.Messages event) => event.messages ?? <td.Message>[]);
}
