import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_state.freezed.dart';

// Single parameter
@freezed
abstract class SubState<TSuccess, TError> with _$SubState<TSuccess, TError> {
  const factory SubState.initial() = _SubInitial;
  const factory SubState.loading() = _SubLoading;
  const factory SubState.success(TSuccess data) = _SubSuccess;
  const factory SubState.failure(TError error) = _SubFailure;
  const SubState._();

  bool get isInitial => this is _SubInitial;
  bool get isLoading => this is _SubLoading;
  bool get isSuccess => this is _SubSuccess;
  bool get isFailure => this is _SubFailure;

  TSuccess? get dataOrNull => whenOrNull(success: (data) => data);
  TError? get errorOrNull => whenOrNull(failure: (err) => err);
}

// Two parameters
@freezed
abstract class SubState2<T1, T2, TError> with _$SubState2<T1, T2, TError> {
  const factory SubState2.initial() = _Sub2Initial;
  const factory SubState2.loading() = _Sub2Loading;
  const factory SubState2.success(T1 data1, T2 data2) = _Sub2Success;
  const factory SubState2.failure(TError error) = _Sub2Failure;
  const SubState2._();

  bool get isInitial => this is _Sub2Initial;
  bool get isLoading => this is _Sub2Loading;
  bool get isSuccess => this is _Sub2Success;
  bool get isFailure => this is _Sub2Failure;

  T1? get data1OrNull => whenOrNull(success: (data1, data2) => data1);
  T2? get data2OrNull => whenOrNull(success: (data1, data2) => data2);
  TError? get errorOrNull => whenOrNull(failure: (err) => err);
}

// Three parameters
@freezed
abstract class SubState3<T1, T2, T3, TError> with _$SubState3<T1, T2, T3, TError> {
  const factory SubState3.initial() = _Sub3Initial;
  const factory SubState3.loading() = _Sub3Loading;
  const factory SubState3.success(T1 data1, T2 data2, T3 data3) = _Sub3Success;
  const factory SubState3.failure(TError error) = _Sub3Failure;
  const SubState3._();

  bool get isInitial => this is _Sub3Initial;
  bool get isLoading => this is _Sub3Loading;
  bool get isSuccess => this is _Sub3Success;
  bool get isFailure => this is _Sub2Failure;

  T1? get data1OrNull => whenOrNull(success: (data1, data2, data3) => data1);
  T2? get data2OrNull => whenOrNull(success: (data1, data2, data3) => data2);
  T3? get data3OrNull => whenOrNull(success: (data1, data2, data3) => data3);
  TError? get errorOrNull => whenOrNull(failure: (err) => err);
}

// Four parameters
@freezed
abstract class SubState4<T1, T2, T3, T4, TError> with _$SubState4<T1, T2, T3, T4, TError> {
  const factory SubState4.initial() = _Sub4Initial;
  const factory SubState4.loading() = _Sub4Loading;
  const factory SubState4.success(T1 data1, T2 data2, T3 data3, T4 data4) = _Sub4Success;
  const factory SubState4.failure(TError error) = _Sub4Failure;
  const SubState4._();

  bool get isInitial => this is _Sub4Initial;
  bool get isLoading => this is _Sub4Loading;
  bool get isSuccess => this is _Sub4Success;
  bool get isFailure => this is _Sub4Failure;

  T1? get data1OrNull => whenOrNull(success: (data1, data2, data3, data4) => data1);
  T2? get data2OrNull => whenOrNull(success: (data1, data2, data3, data4) => data2);
  T3? get data3OrNull => whenOrNull(success: (data1, data2, data3, data4) => data3);
  T4? get data4OrNull => whenOrNull(success: (data1, data2, data3, data4) => data4);
  TError? get errorOrNull => whenOrNull(failure: (err) => err);
}

// Five parameters
@freezed
abstract class SubState5<T1, T2, T3, T4, T5, TError> with _$SubState5<T1, T2, T3, T4, T5, TError> {
  const factory SubState5.initial() = _Sub5Initial;
  const factory SubState5.loading() = _Sub5Loading;
  const factory SubState5.success(T1 data1, T2 data2, T3 data3, T4 data4, T5 data5) = _Sub5Success;
  const factory SubState5.failure(TError error) = _Sub5Failure;
  const SubState5._();

  bool get isInitial => this is _Sub5Initial;
  bool get isLoading => this is _Sub5Loading;
  bool get isSuccess => this is _Sub5Success;
  bool get isFailure => this is _Sub5Failure;

  T1? get data1OrNull => whenOrNull(success: (data1, data2, data3, data4, data5) => data1);
  T2? get data2OrNull => whenOrNull(success: (data1, data2, data3, data4, data5) => data2);
  T3? get data3OrNull => whenOrNull(success: (data1, data2, data3, data4, data5) => data3);
  T4? get data4OrNull => whenOrNull(success: (data1, data2, data3, data4, data5) => data4);
  T5? get data5OrNull => whenOrNull(success: (data1, data2, data3, data4, data5) => data5);
  TError? get errorOrNull => whenOrNull(failure: (err) => err);
}
