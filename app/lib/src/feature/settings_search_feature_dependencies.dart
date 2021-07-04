import 'package:core_tdlib_api/core_tdlib_api.dart';
import 'package:feature_chats_list_api/feature_chats_list_api.dart';
import 'package:feature_global_search_api/feature_global_search_api.dart';
import 'package:feature_main_screen_impl/feature_main_screen_impl.dart';
import 'package:feature_settings_impl/feature_settings_impl.dart';
import 'package:feature_settings_search_impl/feature_settings_search_impl.dart';
import 'package:jugger/jugger.dart' as j;
import 'package:localization_api/localization_api.dart';

class SettingsSearchFeatureDependencies
    implements ISettingsSearchFeatureDependencies {
  @j.inject
  SettingsSearchFeatureDependencies({
    required ISettingsSearchScreenRouter router,
    required IConnectionStateProvider connectionStateProvider,
    required ILocalizationManager localizationManager,
  })  : _router = router,
        _connectionStateProvider = connectionStateProvider,
        _localizationManager = localizationManager;

  final ISettingsSearchScreenRouter _router;
  final ILocalizationManager _localizationManager;
  final IConnectionStateProvider _connectionStateProvider;

  @override
  ISettingsSearchScreenRouter get router => _router;

  @override
  ILocalizationManager get localizationManager => _localizationManager;

  @override
  IConnectionStateProvider get connectionStateProvider =>
      _connectionStateProvider;
}
