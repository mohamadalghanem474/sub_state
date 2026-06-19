/// 🧩 **sub_state** — a lightweight, type-safe state holder for Dart & Flutter.
///
/// Every operation lives in exactly one of four states — `initial`, `loading`,
/// `success` or `failure` — modelled with Dart 3 [sealed] classes. That gives
/// you compile-time-exhaustive `switch` pattern matching for free, plus the
/// familiar `when` / `map` / `copyWith` helpers.
///
/// Pick the variant that matches how many success values you carry:
/// [SubState] (1) · [SubState2] (2) · [SubState3] (3) · [SubState4] (4) ·
/// [SubState5] (5).
library;

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// Private sentinel used by the `copyWith` helpers to distinguish "argument
/// omitted" from "argument explicitly set to `null`".
const Object _unset = Object();

bool _eq(Object? a, Object? b) => const DeepCollectionEquality().equals(a, b);
int _hash(Object? value) => const DeepCollectionEquality().hash(value);

// =============================================================================
// SubState — single success value
// =============================================================================

/// A type-safe state for an operation that yields a single value of type
/// [TSuccess], or fails with an error of type [TError].
///
/// ```dart
/// SubState<int, String> state = const SubState.loading();
/// state = const SubState.success(42);
///
/// // Native, exhaustive pattern matching:
/// final label = switch (state) {
///   SubInitial() => 'idle',
///   SubLoading() => 'loading…',
///   SubSuccess(:final data) => 'got $data',
///   SubFailure(:final error) => 'error: $error',
/// };
/// ```
sealed class SubState<TSuccess, TError> {
  const SubState();

  /// The idle state, before anything has started.
  const factory SubState.initial() = SubInitial<TSuccess, TError>;

  /// The in-flight state, while the operation is running.
  const factory SubState.loading() = SubLoading<TSuccess, TError>;

  /// The succeeded state, carrying [data].
  const factory SubState.success(TSuccess data) = SubSuccess<TSuccess, TError>;

  /// The failed state, carrying [error].
  const factory SubState.failure(TError error) = SubFailure<TSuccess, TError>;

  /// Whether this is [SubState.initial].
  bool get isInitial => this is SubInitial<TSuccess, TError>;

  /// Whether this is [SubState.loading].
  bool get isLoading => this is SubLoading<TSuccess, TError>;

  /// Whether this is [SubState.success].
  bool get isSuccess => this is SubSuccess<TSuccess, TError>;

  /// Whether this is [SubState.failure].
  bool get isFailure => this is SubFailure<TSuccess, TError>;

  /// The success value, or `null` when not in the success state.
  TSuccess? get dataOrNull => switch (this) { SubSuccess(:final data) => data, _ => null };

  /// The error value, or `null` when not in the failure state.
  TError? get errorOrNull => switch (this) { SubFailure(:final error) => error, _ => null };

  /// Exhaustively map every state to a value of type [R].
  @optionalTypeArgs
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(TSuccess data) success,
    required R Function(TError error) failure,
  }) =>
      switch (this) {
        SubInitial() => initial(),
        SubLoading() => loading(),
        SubSuccess(:final data) => success(data),
        SubFailure(:final error) => failure(error),
      };

  /// Like [when], but unhandled states fall back to [orElse].
  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(TSuccess data)? success,
    R Function(TError error)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        SubInitial() when initial != null => initial(),
        SubLoading() when loading != null => loading(),
        SubSuccess(:final data) when success != null => success(data),
        SubFailure(:final error) when failure != null => failure(error),
        _ => orElse(),
      };

  /// Like [when], but unhandled states return `null`.
  @optionalTypeArgs
  R? whenOrNull<R>({
    R? Function()? initial,
    R? Function()? loading,
    R? Function(TSuccess data)? success,
    R? Function(TError error)? failure,
  }) =>
      switch (this) {
        SubInitial() when initial != null => initial(),
        SubLoading() when loading != null => loading(),
        SubSuccess(:final data) when success != null => success(data),
        SubFailure(:final error) when failure != null => failure(error),
        _ => null,
      };

  /// Exhaustively map every state to a value of type [R], receiving the raw
  /// state object (handy for accessing [SubSuccess.copyWith]).
  @optionalTypeArgs
  R map<R>({
    required R Function(SubInitial<TSuccess, TError> value) initial,
    required R Function(SubLoading<TSuccess, TError> value) loading,
    required R Function(SubSuccess<TSuccess, TError> value) success,
    required R Function(SubFailure<TSuccess, TError> value) failure,
  }) =>
      switch (this) {
        final SubInitial<TSuccess, TError> v => initial(v),
        final SubLoading<TSuccess, TError> v => loading(v),
        final SubSuccess<TSuccess, TError> v => success(v),
        final SubFailure<TSuccess, TError> v => failure(v),
      };

  /// Like [map], but unhandled states fall back to [orElse].
  @optionalTypeArgs
  R maybeMap<R>({
    R Function(SubInitial<TSuccess, TError> value)? initial,
    R Function(SubLoading<TSuccess, TError> value)? loading,
    R Function(SubSuccess<TSuccess, TError> value)? success,
    R Function(SubFailure<TSuccess, TError> value)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        final SubInitial<TSuccess, TError> v when initial != null => initial(v),
        final SubLoading<TSuccess, TError> v when loading != null => loading(v),
        final SubSuccess<TSuccess, TError> v when success != null => success(v),
        final SubFailure<TSuccess, TError> v when failure != null => failure(v),
        _ => orElse(),
      };

  /// Like [map], but unhandled states return `null`.
  @optionalTypeArgs
  R? mapOrNull<R>({
    R? Function(SubInitial<TSuccess, TError> value)? initial,
    R? Function(SubLoading<TSuccess, TError> value)? loading,
    R? Function(SubSuccess<TSuccess, TError> value)? success,
    R? Function(SubFailure<TSuccess, TError> value)? failure,
  }) =>
      switch (this) {
        final SubInitial<TSuccess, TError> v when initial != null => initial(v),
        final SubLoading<TSuccess, TError> v when loading != null => loading(v),
        final SubSuccess<TSuccess, TError> v when success != null => success(v),
        final SubFailure<TSuccess, TError> v when failure != null => failure(v),
        _ => null,
      };
}

/// The idle variant of [SubState].
final class SubInitial<TSuccess, TError> extends SubState<TSuccess, TError> {
  const SubInitial();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is SubInitial<TSuccess, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState<$TSuccess, $TError>.initial()';
}

/// The in-flight variant of [SubState].
final class SubLoading<TSuccess, TError> extends SubState<TSuccess, TError> {
  const SubLoading();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is SubLoading<TSuccess, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState<$TSuccess, $TError>.loading()';
}

/// The succeeded variant of [SubState], carrying [data].
final class SubSuccess<TSuccess, TError> extends SubState<TSuccess, TError> {
  const SubSuccess(this.data);

  /// The successfully produced value.
  final TSuccess data;

  /// Returns a copy with [data] replaced. Omitting [data] keeps the current
  /// value. Passing a value whose type is not [TSuccess] (including `null` for a
  /// non-nullable [TSuccess]) throws a `TypeError` at runtime.
  @useResult
  SubSuccess<TSuccess, TError> copyWith({Object? data = _unset}) => SubSuccess<TSuccess, TError>(
        identical(data, _unset) ? this.data : data as TSuccess,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is SubSuccess<TSuccess, TError> && _eq(other.data, data));

  @override
  int get hashCode => Object.hash(runtimeType, _hash(data));

  @override
  String toString() => 'SubState<$TSuccess, $TError>.success(data: $data)';
}

/// The failed variant of [SubState], carrying [error].
final class SubFailure<TSuccess, TError> extends SubState<TSuccess, TError> {
  const SubFailure(this.error);

  /// The error that caused the failure.
  final TError error;

  /// Returns a copy with [error] replaced. Omitting [error] keeps the current
  /// value. Passing a value whose type is not [TError] (including `null` for a
  /// non-nullable [TError]) throws a `TypeError` at runtime.
  @useResult
  SubFailure<TSuccess, TError> copyWith({Object? error = _unset}) => SubFailure<TSuccess, TError>(
        identical(error, _unset) ? this.error : error as TError,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is SubFailure<TSuccess, TError> && _eq(other.error, error));

  @override
  int get hashCode => Object.hash(runtimeType, _hash(error));

  @override
  String toString() => 'SubState<$TSuccess, $TError>.failure(error: $error)';
}

// =============================================================================
// SubState2 — two success values
// =============================================================================

/// A type-safe state carrying two success values ([T1], [T2]) on success, or an
/// error of type [TError] on failure. See [SubState] for the full API.
sealed class SubState2<T1, T2, TError> {
  const SubState2();

  const factory SubState2.initial() = Sub2Initial<T1, T2, TError>;
  const factory SubState2.loading() = Sub2Loading<T1, T2, TError>;
  const factory SubState2.success(T1 data1, T2 data2) = Sub2Success<T1, T2, TError>;
  const factory SubState2.failure(TError error) = Sub2Failure<T1, T2, TError>;

  bool get isInitial => this is Sub2Initial<T1, T2, TError>;
  bool get isLoading => this is Sub2Loading<T1, T2, TError>;
  bool get isSuccess => this is Sub2Success<T1, T2, TError>;
  bool get isFailure => this is Sub2Failure<T1, T2, TError>;

  T1? get data1OrNull => switch (this) { Sub2Success(:final data1) => data1, _ => null };
  T2? get data2OrNull => switch (this) { Sub2Success(:final data2) => data2, _ => null };
  TError? get errorOrNull => switch (this) { Sub2Failure(:final error) => error, _ => null };

  @optionalTypeArgs
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T1 data1, T2 data2) success,
    required R Function(TError error) failure,
  }) =>
      switch (this) {
        Sub2Initial() => initial(),
        Sub2Loading() => loading(),
        Sub2Success(:final data1, :final data2) => success(data1, data2),
        Sub2Failure(:final error) => failure(error),
      };

  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T1 data1, T2 data2)? success,
    R Function(TError error)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        Sub2Initial() when initial != null => initial(),
        Sub2Loading() when loading != null => loading(),
        Sub2Success(:final data1, :final data2) when success != null => success(data1, data2),
        Sub2Failure(:final error) when failure != null => failure(error),
        _ => orElse(),
      };

  @optionalTypeArgs
  R? whenOrNull<R>({
    R? Function()? initial,
    R? Function()? loading,
    R? Function(T1 data1, T2 data2)? success,
    R? Function(TError error)? failure,
  }) =>
      switch (this) {
        Sub2Initial() when initial != null => initial(),
        Sub2Loading() when loading != null => loading(),
        Sub2Success(:final data1, :final data2) when success != null => success(data1, data2),
        Sub2Failure(:final error) when failure != null => failure(error),
        _ => null,
      };

  @optionalTypeArgs
  R map<R>({
    required R Function(Sub2Initial<T1, T2, TError> value) initial,
    required R Function(Sub2Loading<T1, T2, TError> value) loading,
    required R Function(Sub2Success<T1, T2, TError> value) success,
    required R Function(Sub2Failure<T1, T2, TError> value) failure,
  }) =>
      switch (this) {
        final Sub2Initial<T1, T2, TError> v => initial(v),
        final Sub2Loading<T1, T2, TError> v => loading(v),
        final Sub2Success<T1, T2, TError> v => success(v),
        final Sub2Failure<T1, T2, TError> v => failure(v),
      };

  @optionalTypeArgs
  R maybeMap<R>({
    R Function(Sub2Initial<T1, T2, TError> value)? initial,
    R Function(Sub2Loading<T1, T2, TError> value)? loading,
    R Function(Sub2Success<T1, T2, TError> value)? success,
    R Function(Sub2Failure<T1, T2, TError> value)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        final Sub2Initial<T1, T2, TError> v when initial != null => initial(v),
        final Sub2Loading<T1, T2, TError> v when loading != null => loading(v),
        final Sub2Success<T1, T2, TError> v when success != null => success(v),
        final Sub2Failure<T1, T2, TError> v when failure != null => failure(v),
        _ => orElse(),
      };

  @optionalTypeArgs
  R? mapOrNull<R>({
    R? Function(Sub2Initial<T1, T2, TError> value)? initial,
    R? Function(Sub2Loading<T1, T2, TError> value)? loading,
    R? Function(Sub2Success<T1, T2, TError> value)? success,
    R? Function(Sub2Failure<T1, T2, TError> value)? failure,
  }) =>
      switch (this) {
        final Sub2Initial<T1, T2, TError> v when initial != null => initial(v),
        final Sub2Loading<T1, T2, TError> v when loading != null => loading(v),
        final Sub2Success<T1, T2, TError> v when success != null => success(v),
        final Sub2Failure<T1, T2, TError> v when failure != null => failure(v),
        _ => null,
      };
}

final class Sub2Initial<T1, T2, TError> extends SubState2<T1, T2, TError> {
  const Sub2Initial();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub2Initial<T1, T2, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState2<$T1, $T2, $TError>.initial()';
}

final class Sub2Loading<T1, T2, TError> extends SubState2<T1, T2, TError> {
  const Sub2Loading();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub2Loading<T1, T2, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState2<$T1, $T2, $TError>.loading()';
}

final class Sub2Success<T1, T2, TError> extends SubState2<T1, T2, TError> {
  const Sub2Success(this.data1, this.data2);

  final T1 data1;
  final T2 data2;

  @useResult
  Sub2Success<T1, T2, TError> copyWith({
    Object? data1 = _unset,
    Object? data2 = _unset,
  }) =>
      Sub2Success<T1, T2, TError>(
        identical(data1, _unset) ? this.data1 : data1 as T1,
        identical(data2, _unset) ? this.data2 : data2 as T2,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub2Success<T1, T2, TError> && _eq(other.data1, data1) && _eq(other.data2, data2));

  @override
  int get hashCode => Object.hash(runtimeType, _hash(data1), _hash(data2));

  @override
  String toString() => 'SubState2<$T1, $T2, $TError>.success(data1: $data1, data2: $data2)';
}

final class Sub2Failure<T1, T2, TError> extends SubState2<T1, T2, TError> {
  const Sub2Failure(this.error);

  final TError error;

  @useResult
  Sub2Failure<T1, T2, TError> copyWith({Object? error = _unset}) => Sub2Failure<T1, T2, TError>(
        identical(error, _unset) ? this.error : error as TError,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub2Failure<T1, T2, TError> && _eq(other.error, error));

  @override
  int get hashCode => Object.hash(runtimeType, _hash(error));

  @override
  String toString() => 'SubState2<$T1, $T2, $TError>.failure(error: $error)';
}

// =============================================================================
// SubState3 — three success values
// =============================================================================

/// A type-safe state carrying three success values ([T1], [T2], [T3]) on
/// success, or an error of type [TError] on failure. See [SubState] for the
/// full API.
sealed class SubState3<T1, T2, T3, TError> {
  const SubState3();

  const factory SubState3.initial() = Sub3Initial<T1, T2, T3, TError>;
  const factory SubState3.loading() = Sub3Loading<T1, T2, T3, TError>;
  const factory SubState3.success(T1 data1, T2 data2, T3 data3) = Sub3Success<T1, T2, T3, TError>;
  const factory SubState3.failure(TError error) = Sub3Failure<T1, T2, T3, TError>;

  bool get isInitial => this is Sub3Initial<T1, T2, T3, TError>;
  bool get isLoading => this is Sub3Loading<T1, T2, T3, TError>;
  bool get isSuccess => this is Sub3Success<T1, T2, T3, TError>;
  bool get isFailure => this is Sub3Failure<T1, T2, T3, TError>;

  T1? get data1OrNull => switch (this) { Sub3Success(:final data1) => data1, _ => null };
  T2? get data2OrNull => switch (this) { Sub3Success(:final data2) => data2, _ => null };
  T3? get data3OrNull => switch (this) { Sub3Success(:final data3) => data3, _ => null };
  TError? get errorOrNull => switch (this) { Sub3Failure(:final error) => error, _ => null };

  @optionalTypeArgs
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T1 data1, T2 data2, T3 data3) success,
    required R Function(TError error) failure,
  }) =>
      switch (this) {
        Sub3Initial() => initial(),
        Sub3Loading() => loading(),
        Sub3Success(:final data1, :final data2, :final data3) => success(data1, data2, data3),
        Sub3Failure(:final error) => failure(error),
      };

  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T1 data1, T2 data2, T3 data3)? success,
    R Function(TError error)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        Sub3Initial() when initial != null => initial(),
        Sub3Loading() when loading != null => loading(),
        Sub3Success(:final data1, :final data2, :final data3) when success != null => success(data1, data2, data3),
        Sub3Failure(:final error) when failure != null => failure(error),
        _ => orElse(),
      };

  @optionalTypeArgs
  R? whenOrNull<R>({
    R? Function()? initial,
    R? Function()? loading,
    R? Function(T1 data1, T2 data2, T3 data3)? success,
    R? Function(TError error)? failure,
  }) =>
      switch (this) {
        Sub3Initial() when initial != null => initial(),
        Sub3Loading() when loading != null => loading(),
        Sub3Success(:final data1, :final data2, :final data3) when success != null => success(data1, data2, data3),
        Sub3Failure(:final error) when failure != null => failure(error),
        _ => null,
      };

  @optionalTypeArgs
  R map<R>({
    required R Function(Sub3Initial<T1, T2, T3, TError> value) initial,
    required R Function(Sub3Loading<T1, T2, T3, TError> value) loading,
    required R Function(Sub3Success<T1, T2, T3, TError> value) success,
    required R Function(Sub3Failure<T1, T2, T3, TError> value) failure,
  }) =>
      switch (this) {
        final Sub3Initial<T1, T2, T3, TError> v => initial(v),
        final Sub3Loading<T1, T2, T3, TError> v => loading(v),
        final Sub3Success<T1, T2, T3, TError> v => success(v),
        final Sub3Failure<T1, T2, T3, TError> v => failure(v),
      };

  @optionalTypeArgs
  R maybeMap<R>({
    R Function(Sub3Initial<T1, T2, T3, TError> value)? initial,
    R Function(Sub3Loading<T1, T2, T3, TError> value)? loading,
    R Function(Sub3Success<T1, T2, T3, TError> value)? success,
    R Function(Sub3Failure<T1, T2, T3, TError> value)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        final Sub3Initial<T1, T2, T3, TError> v when initial != null => initial(v),
        final Sub3Loading<T1, T2, T3, TError> v when loading != null => loading(v),
        final Sub3Success<T1, T2, T3, TError> v when success != null => success(v),
        final Sub3Failure<T1, T2, T3, TError> v when failure != null => failure(v),
        _ => orElse(),
      };

  @optionalTypeArgs
  R? mapOrNull<R>({
    R? Function(Sub3Initial<T1, T2, T3, TError> value)? initial,
    R? Function(Sub3Loading<T1, T2, T3, TError> value)? loading,
    R? Function(Sub3Success<T1, T2, T3, TError> value)? success,
    R? Function(Sub3Failure<T1, T2, T3, TError> value)? failure,
  }) =>
      switch (this) {
        final Sub3Initial<T1, T2, T3, TError> v when initial != null => initial(v),
        final Sub3Loading<T1, T2, T3, TError> v when loading != null => loading(v),
        final Sub3Success<T1, T2, T3, TError> v when success != null => success(v),
        final Sub3Failure<T1, T2, T3, TError> v when failure != null => failure(v),
        _ => null,
      };
}

final class Sub3Initial<T1, T2, T3, TError> extends SubState3<T1, T2, T3, TError> {
  const Sub3Initial();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub3Initial<T1, T2, T3, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState3<$T1, $T2, $T3, $TError>.initial()';
}

final class Sub3Loading<T1, T2, T3, TError> extends SubState3<T1, T2, T3, TError> {
  const Sub3Loading();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub3Loading<T1, T2, T3, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState3<$T1, $T2, $T3, $TError>.loading()';
}

final class Sub3Success<T1, T2, T3, TError> extends SubState3<T1, T2, T3, TError> {
  const Sub3Success(this.data1, this.data2, this.data3);

  final T1 data1;
  final T2 data2;
  final T3 data3;

  @useResult
  Sub3Success<T1, T2, T3, TError> copyWith({
    Object? data1 = _unset,
    Object? data2 = _unset,
    Object? data3 = _unset,
  }) =>
      Sub3Success<T1, T2, T3, TError>(
        identical(data1, _unset) ? this.data1 : data1 as T1,
        identical(data2, _unset) ? this.data2 : data2 as T2,
        identical(data3, _unset) ? this.data3 : data3 as T3,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub3Success<T1, T2, T3, TError> && _eq(other.data1, data1) && _eq(other.data2, data2) && _eq(other.data3, data3));

  @override
  int get hashCode => Object.hash(runtimeType, _hash(data1), _hash(data2), _hash(data3));

  @override
  String toString() => 'SubState3<$T1, $T2, $T3, $TError>.success(data1: $data1, data2: $data2, data3: $data3)';
}

final class Sub3Failure<T1, T2, T3, TError> extends SubState3<T1, T2, T3, TError> {
  const Sub3Failure(this.error);

  final TError error;

  @useResult
  Sub3Failure<T1, T2, T3, TError> copyWith({Object? error = _unset}) => Sub3Failure<T1, T2, T3, TError>(
        identical(error, _unset) ? this.error : error as TError,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub3Failure<T1, T2, T3, TError> && _eq(other.error, error));

  @override
  int get hashCode => Object.hash(runtimeType, _hash(error));

  @override
  String toString() => 'SubState3<$T1, $T2, $T3, $TError>.failure(error: $error)';
}

// =============================================================================
// SubState4 — four success values
// =============================================================================

/// A type-safe state carrying four success values ([T1]–[T4]) on success, or an
/// error of type [TError] on failure. See [SubState] for the full API.
sealed class SubState4<T1, T2, T3, T4, TError> {
  const SubState4();

  const factory SubState4.initial() = Sub4Initial<T1, T2, T3, T4, TError>;
  const factory SubState4.loading() = Sub4Loading<T1, T2, T3, T4, TError>;
  const factory SubState4.success(T1 data1, T2 data2, T3 data3, T4 data4) = Sub4Success<T1, T2, T3, T4, TError>;
  const factory SubState4.failure(TError error) = Sub4Failure<T1, T2, T3, T4, TError>;

  bool get isInitial => this is Sub4Initial<T1, T2, T3, T4, TError>;
  bool get isLoading => this is Sub4Loading<T1, T2, T3, T4, TError>;
  bool get isSuccess => this is Sub4Success<T1, T2, T3, T4, TError>;
  bool get isFailure => this is Sub4Failure<T1, T2, T3, T4, TError>;

  T1? get data1OrNull => switch (this) { Sub4Success(:final data1) => data1, _ => null };
  T2? get data2OrNull => switch (this) { Sub4Success(:final data2) => data2, _ => null };
  T3? get data3OrNull => switch (this) { Sub4Success(:final data3) => data3, _ => null };
  T4? get data4OrNull => switch (this) { Sub4Success(:final data4) => data4, _ => null };
  TError? get errorOrNull => switch (this) { Sub4Failure(:final error) => error, _ => null };

  @optionalTypeArgs
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T1 data1, T2 data2, T3 data3, T4 data4) success,
    required R Function(TError error) failure,
  }) =>
      switch (this) {
        Sub4Initial() => initial(),
        Sub4Loading() => loading(),
        Sub4Success(:final data1, :final data2, :final data3, :final data4) => success(data1, data2, data3, data4),
        Sub4Failure(:final error) => failure(error),
      };

  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T1 data1, T2 data2, T3 data3, T4 data4)? success,
    R Function(TError error)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        Sub4Initial() when initial != null => initial(),
        Sub4Loading() when loading != null => loading(),
        Sub4Success(:final data1, :final data2, :final data3, :final data4) when success != null => success(data1, data2, data3, data4),
        Sub4Failure(:final error) when failure != null => failure(error),
        _ => orElse(),
      };

  @optionalTypeArgs
  R? whenOrNull<R>({
    R? Function()? initial,
    R? Function()? loading,
    R? Function(T1 data1, T2 data2, T3 data3, T4 data4)? success,
    R? Function(TError error)? failure,
  }) =>
      switch (this) {
        Sub4Initial() when initial != null => initial(),
        Sub4Loading() when loading != null => loading(),
        Sub4Success(:final data1, :final data2, :final data3, :final data4) when success != null => success(data1, data2, data3, data4),
        Sub4Failure(:final error) when failure != null => failure(error),
        _ => null,
      };

  @optionalTypeArgs
  R map<R>({
    required R Function(Sub4Initial<T1, T2, T3, T4, TError> value) initial,
    required R Function(Sub4Loading<T1, T2, T3, T4, TError> value) loading,
    required R Function(Sub4Success<T1, T2, T3, T4, TError> value) success,
    required R Function(Sub4Failure<T1, T2, T3, T4, TError> value) failure,
  }) =>
      switch (this) {
        final Sub4Initial<T1, T2, T3, T4, TError> v => initial(v),
        final Sub4Loading<T1, T2, T3, T4, TError> v => loading(v),
        final Sub4Success<T1, T2, T3, T4, TError> v => success(v),
        final Sub4Failure<T1, T2, T3, T4, TError> v => failure(v),
      };

  @optionalTypeArgs
  R maybeMap<R>({
    R Function(Sub4Initial<T1, T2, T3, T4, TError> value)? initial,
    R Function(Sub4Loading<T1, T2, T3, T4, TError> value)? loading,
    R Function(Sub4Success<T1, T2, T3, T4, TError> value)? success,
    R Function(Sub4Failure<T1, T2, T3, T4, TError> value)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        final Sub4Initial<T1, T2, T3, T4, TError> v when initial != null => initial(v),
        final Sub4Loading<T1, T2, T3, T4, TError> v when loading != null => loading(v),
        final Sub4Success<T1, T2, T3, T4, TError> v when success != null => success(v),
        final Sub4Failure<T1, T2, T3, T4, TError> v when failure != null => failure(v),
        _ => orElse(),
      };

  @optionalTypeArgs
  R? mapOrNull<R>({
    R? Function(Sub4Initial<T1, T2, T3, T4, TError> value)? initial,
    R? Function(Sub4Loading<T1, T2, T3, T4, TError> value)? loading,
    R? Function(Sub4Success<T1, T2, T3, T4, TError> value)? success,
    R? Function(Sub4Failure<T1, T2, T3, T4, TError> value)? failure,
  }) =>
      switch (this) {
        final Sub4Initial<T1, T2, T3, T4, TError> v when initial != null => initial(v),
        final Sub4Loading<T1, T2, T3, T4, TError> v when loading != null => loading(v),
        final Sub4Success<T1, T2, T3, T4, TError> v when success != null => success(v),
        final Sub4Failure<T1, T2, T3, T4, TError> v when failure != null => failure(v),
        _ => null,
      };
}

final class Sub4Initial<T1, T2, T3, T4, TError> extends SubState4<T1, T2, T3, T4, TError> {
  const Sub4Initial();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub4Initial<T1, T2, T3, T4, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState4<$T1, $T2, $T3, $T4, $TError>.initial()';
}

final class Sub4Loading<T1, T2, T3, T4, TError> extends SubState4<T1, T2, T3, T4, TError> {
  const Sub4Loading();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub4Loading<T1, T2, T3, T4, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState4<$T1, $T2, $T3, $T4, $TError>.loading()';
}

final class Sub4Success<T1, T2, T3, T4, TError> extends SubState4<T1, T2, T3, T4, TError> {
  const Sub4Success(this.data1, this.data2, this.data3, this.data4);

  final T1 data1;
  final T2 data2;
  final T3 data3;
  final T4 data4;

  @useResult
  Sub4Success<T1, T2, T3, T4, TError> copyWith({
    Object? data1 = _unset,
    Object? data2 = _unset,
    Object? data3 = _unset,
    Object? data4 = _unset,
  }) =>
      Sub4Success<T1, T2, T3, T4, TError>(
        identical(data1, _unset) ? this.data1 : data1 as T1,
        identical(data2, _unset) ? this.data2 : data2 as T2,
        identical(data3, _unset) ? this.data3 : data3 as T3,
        identical(data4, _unset) ? this.data4 : data4 as T4,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub4Success<T1, T2, T3, T4, TError> && _eq(other.data1, data1) && _eq(other.data2, data2) && _eq(other.data3, data3) && _eq(other.data4, data4));

  @override
  int get hashCode => Object.hash(
        runtimeType,
        _hash(data1),
        _hash(data2),
        _hash(data3),
        _hash(data4),
      );

  @override
  String toString() => 'SubState4<$T1, $T2, $T3, $T4, $TError>.success(data1: $data1, data2: $data2, data3: $data3, data4: $data4)';
}

final class Sub4Failure<T1, T2, T3, T4, TError> extends SubState4<T1, T2, T3, T4, TError> {
  const Sub4Failure(this.error);

  final TError error;

  @useResult
  Sub4Failure<T1, T2, T3, T4, TError> copyWith({Object? error = _unset}) => Sub4Failure<T1, T2, T3, T4, TError>(
        identical(error, _unset) ? this.error : error as TError,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub4Failure<T1, T2, T3, T4, TError> && _eq(other.error, error));

  @override
  int get hashCode => Object.hash(runtimeType, _hash(error));

  @override
  String toString() => 'SubState4<$T1, $T2, $T3, $T4, $TError>.failure(error: $error)';
}

// =============================================================================
// SubState5 — five success values
// =============================================================================

/// A type-safe state carrying five success values ([T1]–[T5]) on success, or an
/// error of type [TError] on failure. See [SubState] for the full API.
sealed class SubState5<T1, T2, T3, T4, T5, TError> {
  const SubState5();

  const factory SubState5.initial() = Sub5Initial<T1, T2, T3, T4, T5, TError>;
  const factory SubState5.loading() = Sub5Loading<T1, T2, T3, T4, T5, TError>;
  const factory SubState5.success(
    T1 data1,
    T2 data2,
    T3 data3,
    T4 data4,
    T5 data5,
  ) = Sub5Success<T1, T2, T3, T4, T5, TError>;
  const factory SubState5.failure(TError error) = Sub5Failure<T1, T2, T3, T4, T5, TError>;

  bool get isInitial => this is Sub5Initial<T1, T2, T3, T4, T5, TError>;
  bool get isLoading => this is Sub5Loading<T1, T2, T3, T4, T5, TError>;
  bool get isSuccess => this is Sub5Success<T1, T2, T3, T4, T5, TError>;
  bool get isFailure => this is Sub5Failure<T1, T2, T3, T4, T5, TError>;

  T1? get data1OrNull => switch (this) { Sub5Success(:final data1) => data1, _ => null };
  T2? get data2OrNull => switch (this) { Sub5Success(:final data2) => data2, _ => null };
  T3? get data3OrNull => switch (this) { Sub5Success(:final data3) => data3, _ => null };
  T4? get data4OrNull => switch (this) { Sub5Success(:final data4) => data4, _ => null };
  T5? get data5OrNull => switch (this) { Sub5Success(:final data5) => data5, _ => null };
  TError? get errorOrNull => switch (this) { Sub5Failure(:final error) => error, _ => null };

  @optionalTypeArgs
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T1 data1, T2 data2, T3 data3, T4 data4, T5 data5) success,
    required R Function(TError error) failure,
  }) =>
      switch (this) {
        Sub5Initial() => initial(),
        Sub5Loading() => loading(),
        Sub5Success(:final data1, :final data2, :final data3, :final data4, :final data5) => success(data1, data2, data3, data4, data5),
        Sub5Failure(:final error) => failure(error),
      };

  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T1 data1, T2 data2, T3 data3, T4 data4, T5 data5)? success,
    R Function(TError error)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        Sub5Initial() when initial != null => initial(),
        Sub5Loading() when loading != null => loading(),
        Sub5Success(:final data1, :final data2, :final data3, :final data4, :final data5) when success != null => success(data1, data2, data3, data4, data5),
        Sub5Failure(:final error) when failure != null => failure(error),
        _ => orElse(),
      };

  @optionalTypeArgs
  R? whenOrNull<R>({
    R? Function()? initial,
    R? Function()? loading,
    R? Function(T1 data1, T2 data2, T3 data3, T4 data4, T5 data5)? success,
    R? Function(TError error)? failure,
  }) =>
      switch (this) {
        Sub5Initial() when initial != null => initial(),
        Sub5Loading() when loading != null => loading(),
        Sub5Success(:final data1, :final data2, :final data3, :final data4, :final data5) when success != null => success(data1, data2, data3, data4, data5),
        Sub5Failure(:final error) when failure != null => failure(error),
        _ => null,
      };

  @optionalTypeArgs
  R map<R>({
    required R Function(Sub5Initial<T1, T2, T3, T4, T5, TError> value) initial,
    required R Function(Sub5Loading<T1, T2, T3, T4, T5, TError> value) loading,
    required R Function(Sub5Success<T1, T2, T3, T4, T5, TError> value) success,
    required R Function(Sub5Failure<T1, T2, T3, T4, T5, TError> value) failure,
  }) =>
      switch (this) {
        final Sub5Initial<T1, T2, T3, T4, T5, TError> v => initial(v),
        final Sub5Loading<T1, T2, T3, T4, T5, TError> v => loading(v),
        final Sub5Success<T1, T2, T3, T4, T5, TError> v => success(v),
        final Sub5Failure<T1, T2, T3, T4, T5, TError> v => failure(v),
      };

  @optionalTypeArgs
  R maybeMap<R>({
    R Function(Sub5Initial<T1, T2, T3, T4, T5, TError> value)? initial,
    R Function(Sub5Loading<T1, T2, T3, T4, T5, TError> value)? loading,
    R Function(Sub5Success<T1, T2, T3, T4, T5, TError> value)? success,
    R Function(Sub5Failure<T1, T2, T3, T4, T5, TError> value)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        final Sub5Initial<T1, T2, T3, T4, T5, TError> v when initial != null => initial(v),
        final Sub5Loading<T1, T2, T3, T4, T5, TError> v when loading != null => loading(v),
        final Sub5Success<T1, T2, T3, T4, T5, TError> v when success != null => success(v),
        final Sub5Failure<T1, T2, T3, T4, T5, TError> v when failure != null => failure(v),
        _ => orElse(),
      };

  @optionalTypeArgs
  R? mapOrNull<R>({
    R? Function(Sub5Initial<T1, T2, T3, T4, T5, TError> value)? initial,
    R? Function(Sub5Loading<T1, T2, T3, T4, T5, TError> value)? loading,
    R? Function(Sub5Success<T1, T2, T3, T4, T5, TError> value)? success,
    R? Function(Sub5Failure<T1, T2, T3, T4, T5, TError> value)? failure,
  }) =>
      switch (this) {
        final Sub5Initial<T1, T2, T3, T4, T5, TError> v when initial != null => initial(v),
        final Sub5Loading<T1, T2, T3, T4, T5, TError> v when loading != null => loading(v),
        final Sub5Success<T1, T2, T3, T4, T5, TError> v when success != null => success(v),
        final Sub5Failure<T1, T2, T3, T4, T5, TError> v when failure != null => failure(v),
        _ => null,
      };
}

final class Sub5Initial<T1, T2, T3, T4, T5, TError> extends SubState5<T1, T2, T3, T4, T5, TError> {
  const Sub5Initial();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub5Initial<T1, T2, T3, T4, T5, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState5<$T1, $T2, $T3, $T4, $T5, $TError>.initial()';
}

final class Sub5Loading<T1, T2, T3, T4, T5, TError> extends SubState5<T1, T2, T3, T4, T5, TError> {
  const Sub5Loading();

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub5Loading<T1, T2, T3, T4, T5, TError>);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SubState5<$T1, $T2, $T3, $T4, $T5, $TError>.loading()';
}

final class Sub5Success<T1, T2, T3, T4, T5, TError> extends SubState5<T1, T2, T3, T4, T5, TError> {
  const Sub5Success(
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
  );

  final T1 data1;
  final T2 data2;
  final T3 data3;
  final T4 data4;
  final T5 data5;

  @useResult
  Sub5Success<T1, T2, T3, T4, T5, TError> copyWith({
    Object? data1 = _unset,
    Object? data2 = _unset,
    Object? data3 = _unset,
    Object? data4 = _unset,
    Object? data5 = _unset,
  }) =>
      Sub5Success<T1, T2, T3, T4, T5, TError>(
        identical(data1, _unset) ? this.data1 : data1 as T1,
        identical(data2, _unset) ? this.data2 : data2 as T2,
        identical(data3, _unset) ? this.data3 : data3 as T3,
        identical(data4, _unset) ? this.data4 : data4 as T4,
        identical(data5, _unset) ? this.data5 : data5 as T5,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub5Success<T1, T2, T3, T4, T5, TError> && _eq(other.data1, data1) && _eq(other.data2, data2) && _eq(other.data3, data3) && _eq(other.data4, data4) && _eq(other.data5, data5));

  @override
  int get hashCode => Object.hash(
        runtimeType,
        _hash(data1),
        _hash(data2),
        _hash(data3),
        _hash(data4),
        _hash(data5),
      );

  @override
  String toString() => 'SubState5<$T1, $T2, $T3, $T4, $T5, $TError>.success(data1: $data1, data2: $data2, data3: $data3, data4: $data4, data5: $data5)';
}

final class Sub5Failure<T1, T2, T3, T4, T5, TError> extends SubState5<T1, T2, T3, T4, T5, TError> {
  const Sub5Failure(this.error);

  final TError error;

  @useResult
  Sub5Failure<T1, T2, T3, T4, T5, TError> copyWith({Object? error = _unset}) => Sub5Failure<T1, T2, T3, T4, T5, TError>(
        identical(error, _unset) ? this.error : error as TError,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || (other.runtimeType == runtimeType && other is Sub5Failure<T1, T2, T3, T4, T5, TError> && _eq(other.error, error));

  @override
  int get hashCode => Object.hash(runtimeType, _hash(error));

  @override
  String toString() => 'SubState5<$T1, $T2, $T3, $T4, $T5, $TError>.failure(error: $error)';
}
