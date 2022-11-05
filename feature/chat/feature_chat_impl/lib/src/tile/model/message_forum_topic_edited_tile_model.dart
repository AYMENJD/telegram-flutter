import 'base_message_tile_model.dart';

class MessageForumTopicEditedTileModel extends BaseMessageTileModel {
  const MessageForumTopicEditedTileModel({
    required super.id,
    required super.isOutgoing,
    required this.type,
  });

  final String type;
}
