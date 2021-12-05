import 'package:coreui/coreui.dart' as tg;
import 'package:feature_folders_impl/feature_folders_impl.dart';
import 'package:jugger/jugger.dart' as j;
import 'package:localization_api/localization_api.dart';

@j.Component(modules: <Type>[FoldersModule])
abstract class FoldersComponent {
  tg.TgAppBarFactory getTgAppBarFactory();

  ILocalizationManager getLocalizationManager();

  IFoldersRouter getFoldersRouter();
}

@j.module
abstract class FoldersModule {
  @j.singleton
  @j.provide
  static tg.TgAppBarFactory provideTgAppBarFactory(
    FoldersFeatureDependencies dependencies,
  ) =>
      tg.TgAppBarFactory(
        connectionStateWidgetFactory: tg.ConnectionStateWidgetFactory(
          connectionStateProvider: dependencies.connectionStateProvider,
        ),
      );

  @j.singleton
  @j.provide
  static ILocalizationManager provideLocalizationManager(
    FoldersFeatureDependencies dependencies,
  ) =>
      dependencies.localizationManager;

  @j.singleton
  @j.provide
  static IFoldersRouter provideFoldersRouter(
    FoldersFeatureDependencies dependencies,
  ) =>
      dependencies.router;
}

@j.componentBuilder
abstract class FoldersComponentBuilder {
  FoldersComponentBuilder dependencies(
    FoldersFeatureDependencies dependencies,
  );

  FoldersComponent build();
}
