import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_state.freezed.dart';

@Freezed(copyWith: false)
abstract class SubState<TSuccess> with _$SubState<TSuccess> {
  const factory SubState.success(TSuccess data) = _SubSuccess;
  const factory SubState.loading() = _SubLoading;
  const factory SubState.failure(String error) = _SubFailure;
  const factory SubState.initial() = _SubInitial;
  const SubState._();

  bool get isInitial => this is _SubInitial;
  bool get isLoading => this is _SubLoading;
  bool get isSuccess => this is _SubSuccess;
  bool get isFailure => this is _SubFailure;

  TSuccess? get dataOrNull => whenOrNull(success: (data) => data);
  String? get errorOrNull => whenOrNull(failure: (err) => err);
}