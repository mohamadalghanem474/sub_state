// ignore_for_file: deprecated_member_use_from_same_package

import 'package:bloc/bloc.dart';
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

abstract class CubitSubState<T> extends Cubit<SubState<T>> {
  CubitSubState() : super(SubState<T>.initial());

  @Deprecated('Use new emit methods instead like emitSuccess or emitFailure')
  @protected
  @visibleForTesting
  @override
  void emit(SubState<T> state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @protected
  @visibleForTesting
  void emitInitial() => emit(SubState<T>.initial());
  @protected
  @visibleForTesting
  void emitSuccess(T data) => emit(SubState<T>.success(data));
  @protected
  @visibleForTesting
  void emitFailure(String error) => emit(SubState<T>.failure(error));
  @protected
  @visibleForTesting
  void emitLoading() => emit(SubState<T>.loading());
}
