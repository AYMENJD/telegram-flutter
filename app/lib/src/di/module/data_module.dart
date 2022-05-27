import 'package:core_tdlib_api/core_tdlib_api.dart';
import 'package:core_tdlib_impl/core_tdlib_impl.dart';
import 'package:jugger/jugger.dart' as j;

@j.module
abstract class DataModule {
  // region data source

  @j.provides
  static ChatMessageDataSource provideChatMessageDataSource(
    ITdFunctionExecutor functionExecutor,
  ) =>
      ChatMessageDataSource(functionExecutor: functionExecutor);

  @j.provides
  static ChatDataSource provideChatDataSource(
    ITdFunctionExecutor functionExecutor,
  ) =>
      ChatDataSource(functionExecutor: functionExecutor);

  @j.provides
  static FileDataSource provideFileDataSource(
    ITdFunctionExecutor functionExecutor,
    IEventsProvider eventsProvider,
  ) =>
      FileDataSource(
        functionExecutor: functionExecutor,
        eventsProvider: eventsProvider,
      );

  @j.provides
  static UserDataSource provideUserDataSource(
    ITdFunctionExecutor functionExecutor,
    IUserUpdatesProvider userUpdatesProvider,
  ) =>
      UserDataSource(
        functionExecutor: functionExecutor,
        userUpdatesProvider: userUpdatesProvider,
      );

  @j.provides
  static StickerDataSource provideStickerDataSource(
    ITdFunctionExecutor functionExecutor,
  ) =>
      StickerDataSource(functionExecutor: functionExecutor);

  @j.provides
  static BackgroundDataSource provideBackgroundDataSource(
    ITdFunctionExecutor functionExecutor,
  ) =>
      BackgroundDataSource(functionExecutor: functionExecutor);

  @j.provides
  static SessionDataSource provideSessionDataSource(
    ITdFunctionExecutor functionExecutor,
  ) =>
      SessionDataSource(functionExecutor: functionExecutor);

  @j.provides
  static ChatFilterDataSource provideChatFilterDataSource(
    IChatFiltersUpdatesProvider chatFiltersUpdatesProvider,
  ) =>
      ChatFilterDataSource(
        chatFiltersUpdatesProvider: chatFiltersUpdatesProvider,
      );

  @j.provides
  static SuperGroupDataSource provideSuperGroupDataSource(
    ITdFunctionExecutor functionExecutor,
  ) =>
      SuperGroupDataSource(functionExecutor: functionExecutor);

  // endregion data source

  // region repository

  @j.singleton
  @j.provides
  static BasicGroupDataSource provideBasicGroupDataSource(
    ITdFunctionExecutor functionExecutor,
  ) =>
      BasicGroupDataSource(functionExecutor: functionExecutor);

  @j.singleton
  @j.provides
  static IChatMessageRepository provideChatMessageRepository(
    ChatMessageDataSource dataSource,
  ) =>
      ChatMessageRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  static IChatRepository provideChatRepository(
    ChatDataSource dataSource,
  ) =>
      ChatRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  static IFileRepository provideFileRepository(
    FileDataSource dataSource,
  ) =>
      FileRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  static IUserRepository provideUserRepository(
    UserDataSource dataSource,
  ) =>
      UserRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  static IStickerRepository provideStickerRepository(
    StickerDataSource dataSource,
  ) =>
      StickerRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  static IBackgroundRepository provideBackgroundRepository(
    BackgroundDataSource dataSource,
  ) =>
      BackgroundRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  static ISessionRepository provideSessionRepository(
    SessionDataSource dataSource,
  ) =>
      SessionRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  @j.nonLazy
  static IChatFilterRepository provideChatFilterRepository(
    ChatFilterDataSource dataSource,
  ) =>
      ChatFilterRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  static IBasicGroupRepository provideBasicGroupRepository(
    BasicGroupDataSource dataSource,
  ) =>
      BasicGroupRepositoryImpl(dataSource: dataSource);

  @j.singleton
  @j.provides
  static ISuperGroupRepository provideSuperGroupRepository(
    SuperGroupDataSource dataSource,
  ) =>
      SuperGroupRepositoryImpl(dataSource: dataSource);

// endregion repository
}
