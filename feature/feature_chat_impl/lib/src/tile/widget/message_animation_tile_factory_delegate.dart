import 'package:coreui/coreui.dart';
import 'package:feature_chat_impl/feature_chat_impl.dart';
import 'package:feature_chat_impl/src/tile/model/tile_model.dart';
import 'package:feature_chat_impl/src/util/minithumbnail.dart';
import 'package:feature_chat_impl/src/widget/chat_message/chat_message_factory.dart';
import 'package:feature_chat_impl/src/widget/media_widget.dart';
import 'package:feature_chat_impl/src/widget/message_composite_text.dart';
import 'package:feature_chat_impl/src/widget/not_implemented_placeholder.dart';
import 'package:flutter/material.dart';

class MessageAnimationTileFactoryDelegate
    implements ITileFactoryDelegate<MessageAnimationTileModel> {
  MessageAnimationTileFactoryDelegate({
    required ChatMessageFactory chatMessageFactory,
    required ReplyInfoFactory replyInfoFactory,
  })  : _chatMessageFactory = chatMessageFactory,
        _replyInfoFactory = replyInfoFactory;

  final ChatMessageFactory _chatMessageFactory;
  final ReplyInfoFactory _replyInfoFactory;

  @override
  Widget create(BuildContext context, MessageAnimationTileModel model) {
    // todo handle nullable minithumbnail
    if (model.minithumbnail == null) {
      return const NotImplementedPlaceholder(
        additional: 'minithumbnail is null',
      );
    }

    return _chatMessageFactory.createConversationMessage(
        id: model.id,
        context: context,
        isOutgoing: model.isOutgoing,
        reply: _replyInfoFactory.createFromMessageModel(context, model),
        blocks: <Widget>[
          MediaWrapper(
              type: MediaType.Animation,
              child: Container(
                color: Colors.black,
                child: const NotImplementedPlaceholder(
                  additional: 'MessageAnimation',
                ),
              ),
              aspectRatio: model.minithumbnail!.aspectRatio()),
          if (model.caption != null)
            MessageCaption(
              text: model.caption!,
              shortInfo: Text(
                '22:46',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
        ]);
  }
}
