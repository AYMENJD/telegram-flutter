import 'package:freezed_annotation/freezed_annotation.dart';

part 'header_state.freezed.dart';

@freezed
@immutable
class HeaderState with _$HeaderState {
  const factory HeaderState.loading() = Loading;

  const factory HeaderState.data({
    required int userId,
    required String name,
    required String phoneNumberFormatted,
    required bool isDarkTheme,
    int? avatarFileId,
  }) = Data;
}
