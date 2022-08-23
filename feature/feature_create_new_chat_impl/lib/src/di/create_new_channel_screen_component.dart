import 'package:feature_create_new_chat_impl/feature_create_new_chat_impl.dart';
import 'package:jugger/jugger.dart' as j;
import 'package:localization_api/localization_api.dart';

import '../screen/new_channel/new_channel.dart';
import 'create_new_channel_screen_component_builder.dart';
import 'create_new_chat_component.dart';

@j.Component(
  dependencies: <Type>[ICreateNewChatComponent],
  modules: <Type>[CreateNewChannelScreenModule],
  builder: ICreateNewChannelScreenComponentBuilder,
)
@j.singleton
abstract class ICreateNewChannelScreenComponent {
  NewChannelViewModel getNewChannelViewModel();

  IStringsProvider getStringsProvider();

  NewChannelWidgetModel getNewChannelWidgetModel();
}

@j.module
abstract class CreateNewChannelScreenModule {
  @j.singleton
  @j.provides
  static NewChannelViewModel provideNewChannelViewModel(
    ICreateNewChatComponent parentComponent,
    INewChannelScreenRouter router,
  ) =>
      NewChannelViewModel(
        stringsProvider: parentComponent.getStringsProvider(),
        blockInteractionManager: parentComponent.getBlockInteractionManager(),
        errorTransformer: parentComponent.getErrorTransformer(),
        router: router,
        chatManager: parentComponent.getChatManager(),
      );

  @j.singleton
  @j.provides
  static NewChannelWidgetModel provideNewChannelController(
    NewChannelViewModel viewModel,
  ) =>
      NewChannelWidgetModel(viewModel: viewModel);

  @j.binds
  @j.singleton
  INewChannelScreenRouter bindNewChannelScreenRouter(ICreateNewChatRouter impl);
}
