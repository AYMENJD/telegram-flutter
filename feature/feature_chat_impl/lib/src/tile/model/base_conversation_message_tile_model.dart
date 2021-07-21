import 'base_message_tile_model.dart';

abstract class BaseConversationMessageTileModel extends BaseMessageTileModel {
  const BaseConversationMessageTileModel({
    required int id,
    required bool isOutgoing,
    required this.replyInfo,
  }) : super(id: id, isOutgoing: isOutgoing);

  final ReplyInfo? replyInfo;
}

class ReplyInfo {
  const ReplyInfo(
      {required this.replyToMessageId,
      required this.title,
      required this.subtitle});

  final int replyToMessageId;
  final String title;
  final String subtitle;
}
