// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubState<TSuccess> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SubState<TSuccess>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState<$TSuccess>()';
  }
}

/// @nodoc
class $SubStateCopyWith<TSuccess, $Res> {
  $SubStateCopyWith(SubState<TSuccess> _, $Res Function(SubState<TSuccess>) __);
}

/// Adds pattern-matching-related methods to [SubState].
extension SubStatePatterns<TSuccess> on SubState<TSuccess> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubInitial<TSuccess> value)? initial,
    TResult Function(_SubLoading<TSuccess> value)? loading,
    TResult Function(_SubSuccess<TSuccess> value)? success,
    TResult Function(_SubFailure<TSuccess> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubInitial() when initial != null:
        return initial(_that);
      case _SubLoading() when loading != null:
        return loading(_that);
      case _SubSuccess() when success != null:
        return success(_that);
      case _SubFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubInitial<TSuccess> value) initial,
    required TResult Function(_SubLoading<TSuccess> value) loading,
    required TResult Function(_SubSuccess<TSuccess> value) success,
    required TResult Function(_SubFailure<TSuccess> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _SubInitial():
        return initial(_that);
      case _SubLoading():
        return loading(_that);
      case _SubSuccess():
        return success(_that);
      case _SubFailure():
        return failure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubInitial<TSuccess> value)? initial,
    TResult? Function(_SubLoading<TSuccess> value)? loading,
    TResult? Function(_SubSuccess<TSuccess> value)? success,
    TResult? Function(_SubFailure<TSuccess> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _SubInitial() when initial != null:
        return initial(_that);
      case _SubLoading() when loading != null:
        return loading(_that);
      case _SubSuccess() when success != null:
        return success(_that);
      case _SubFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TSuccess data)? success,
    TResult Function(String error, bool show)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubInitial() when initial != null:
        return initial();
      case _SubLoading() when loading != null:
        return loading();
      case _SubSuccess() when success != null:
        return success(_that.data);
      case _SubFailure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TSuccess data) success,
    required TResult Function(String error, bool show) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _SubInitial():
        return initial();
      case _SubLoading():
        return loading();
      case _SubSuccess():
        return success(_that.data);
      case _SubFailure():
        return failure(_that.error, _that.show);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TSuccess data)? success,
    TResult? Function(String error, bool show)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _SubInitial() when initial != null:
        return initial();
      case _SubLoading() when loading != null:
        return loading();
      case _SubSuccess() when success != null:
        return success(_that.data);
      case _SubFailure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SubInitial<TSuccess> extends SubState<TSuccess> {
  const _SubInitial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _SubInitial<TSuccess>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState<$TSuccess>.initial()';
  }
}

/// @nodoc

class _SubLoading<TSuccess> extends SubState<TSuccess> {
  const _SubLoading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _SubLoading<TSuccess>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState<$TSuccess>.loading()';
  }
}

/// @nodoc

class _SubSuccess<TSuccess> extends SubState<TSuccess> {
  const _SubSuccess(this.data) : super._();

  final TSuccess data;

  /// Create a copy of SubState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubSuccessCopyWith<TSuccess, _SubSuccess<TSuccess>> get copyWith => __$SubSuccessCopyWithImpl<TSuccess, _SubSuccess<TSuccess>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _SubSuccess<TSuccess> && const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'SubState<$TSuccess>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SubSuccessCopyWith<TSuccess, $Res> implements $SubStateCopyWith<TSuccess, $Res> {
  factory _$SubSuccessCopyWith(_SubSuccess<TSuccess> value, $Res Function(_SubSuccess<TSuccess>) _then) = __$SubSuccessCopyWithImpl;
  @useResult
  $Res call({TSuccess data});
}

/// @nodoc
class __$SubSuccessCopyWithImpl<TSuccess, $Res> implements _$SubSuccessCopyWith<TSuccess, $Res> {
  __$SubSuccessCopyWithImpl(this._self, this._then);

  final _SubSuccess<TSuccess> _self;
  final $Res Function(_SubSuccess<TSuccess>) _then;

  /// Create a copy of SubState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_SubSuccess<TSuccess>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as TSuccess,
    ));
  }
}

/// @nodoc

class _SubFailure<TSuccess> extends SubState<TSuccess> {
  const _SubFailure(this.error, {this.show = true}) : super._();

  final String error;
  @JsonKey()
  final bool show;

  /// Create a copy of SubState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubFailureCopyWith<TSuccess, _SubFailure<TSuccess>> get copyWith => __$SubFailureCopyWithImpl<TSuccess, _SubFailure<TSuccess>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _SubFailure<TSuccess> && (identical(other.error, error) || other.error == error) && (identical(other.show, show) || other.show == show));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, show);

  @override
  String toString() {
    return 'SubState<$TSuccess>.failure(error: $error, show: $show)';
  }
}

/// @nodoc
abstract mixin class _$SubFailureCopyWith<TSuccess, $Res> implements $SubStateCopyWith<TSuccess, $Res> {
  factory _$SubFailureCopyWith(_SubFailure<TSuccess> value, $Res Function(_SubFailure<TSuccess>) _then) = __$SubFailureCopyWithImpl;
  @useResult
  $Res call({String error, bool show});
}

/// @nodoc
class __$SubFailureCopyWithImpl<TSuccess, $Res> implements _$SubFailureCopyWith<TSuccess, $Res> {
  __$SubFailureCopyWithImpl(this._self, this._then);

  final _SubFailure<TSuccess> _self;
  final $Res Function(_SubFailure<TSuccess>) _then;

  /// Create a copy of SubState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? show = null,
  }) {
    return _then(_SubFailure<TSuccess>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      show: null == show
          ? _self.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$SubState2<T1, T2> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SubState2<T1, T2>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState2<$T1, $T2>()';
  }
}

/// @nodoc
class $SubState2CopyWith<T1, T2, $Res> {
  $SubState2CopyWith(SubState2<T1, T2> _, $Res Function(SubState2<T1, T2>) __);
}

/// Adds pattern-matching-related methods to [SubState2].
extension SubState2Patterns<T1, T2> on SubState2<T1, T2> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Sub2Initial<T1, T2> value)? initial,
    TResult Function(_Sub2Loading<T1, T2> value)? loading,
    TResult Function(_Sub2Success<T1, T2> value)? success,
    TResult Function(_Sub2Failure<T1, T2> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2Initial() when initial != null:
        return initial(_that);
      case _Sub2Loading() when loading != null:
        return loading(_that);
      case _Sub2Success() when success != null:
        return success(_that);
      case _Sub2Failure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Sub2Initial<T1, T2> value) initial,
    required TResult Function(_Sub2Loading<T1, T2> value) loading,
    required TResult Function(_Sub2Success<T1, T2> value) success,
    required TResult Function(_Sub2Failure<T1, T2> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2Initial():
        return initial(_that);
      case _Sub2Loading():
        return loading(_that);
      case _Sub2Success():
        return success(_that);
      case _Sub2Failure():
        return failure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Sub2Initial<T1, T2> value)? initial,
    TResult? Function(_Sub2Loading<T1, T2> value)? loading,
    TResult? Function(_Sub2Success<T1, T2> value)? success,
    TResult? Function(_Sub2Failure<T1, T2> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2Initial() when initial != null:
        return initial(_that);
      case _Sub2Loading() when loading != null:
        return loading(_that);
      case _Sub2Success() when success != null:
        return success(_that);
      case _Sub2Failure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T1 data1, T2 data2)? success,
    TResult Function(String error, bool show)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2Initial() when initial != null:
        return initial();
      case _Sub2Loading() when loading != null:
        return loading();
      case _Sub2Success() when success != null:
        return success(_that.data1, _that.data2);
      case _Sub2Failure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T1 data1, T2 data2) success,
    required TResult Function(String error, bool show) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2Initial():
        return initial();
      case _Sub2Loading():
        return loading();
      case _Sub2Success():
        return success(_that.data1, _that.data2);
      case _Sub2Failure():
        return failure(_that.error, _that.show);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T1 data1, T2 data2)? success,
    TResult? Function(String error, bool show)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2Initial() when initial != null:
        return initial();
      case _Sub2Loading() when loading != null:
        return loading();
      case _Sub2Success() when success != null:
        return success(_that.data1, _that.data2);
      case _Sub2Failure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2Initial<T1, T2> extends SubState2<T1, T2> {
  const _Sub2Initial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub2Initial<T1, T2>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState2<$T1, $T2>.initial()';
  }
}

/// @nodoc

class _Sub2Loading<T1, T2> extends SubState2<T1, T2> {
  const _Sub2Loading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub2Loading<T1, T2>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState2<$T1, $T2>.loading()';
  }
}

/// @nodoc

class _Sub2Success<T1, T2> extends SubState2<T1, T2> {
  const _Sub2Success(this.data1, this.data2) : super._();

  final T1 data1;
  final T2 data2;

  /// Create a copy of SubState2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2SuccessCopyWith<T1, T2, _Sub2Success<T1, T2>> get copyWith => __$Sub2SuccessCopyWithImpl<T1, T2, _Sub2Success<T1, T2>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub2Success<T1, T2> && const DeepCollectionEquality().equals(other.data1, data1) && const DeepCollectionEquality().equals(other.data2, data2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data1), const DeepCollectionEquality().hash(data2));

  @override
  String toString() {
    return 'SubState2<$T1, $T2>.success(data1: $data1, data2: $data2)';
  }
}

/// @nodoc
abstract mixin class _$Sub2SuccessCopyWith<T1, T2, $Res> implements $SubState2CopyWith<T1, T2, $Res> {
  factory _$Sub2SuccessCopyWith(_Sub2Success<T1, T2> value, $Res Function(_Sub2Success<T1, T2>) _then) = __$Sub2SuccessCopyWithImpl;
  @useResult
  $Res call({T1 data1, T2 data2});
}

/// @nodoc
class __$Sub2SuccessCopyWithImpl<T1, T2, $Res> implements _$Sub2SuccessCopyWith<T1, T2, $Res> {
  __$Sub2SuccessCopyWithImpl(this._self, this._then);

  final _Sub2Success<T1, T2> _self;
  final $Res Function(_Sub2Success<T1, T2>) _then;

  /// Create a copy of SubState2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data1 = freezed,
    Object? data2 = freezed,
  }) {
    return _then(_Sub2Success<T1, T2>(
      freezed == data1
          ? _self.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as T1,
      freezed == data2
          ? _self.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as T2,
    ));
  }
}

/// @nodoc

class _Sub2Failure<T1, T2> extends SubState2<T1, T2> {
  const _Sub2Failure(this.error, {this.show = true}) : super._();

  final String error;
  @JsonKey()
  final bool show;

  /// Create a copy of SubState2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2FailureCopyWith<T1, T2, _Sub2Failure<T1, T2>> get copyWith => __$Sub2FailureCopyWithImpl<T1, T2, _Sub2Failure<T1, T2>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub2Failure<T1, T2> && (identical(other.error, error) || other.error == error) && (identical(other.show, show) || other.show == show));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, show);

  @override
  String toString() {
    return 'SubState2<$T1, $T2>.failure(error: $error, show: $show)';
  }
}

/// @nodoc
abstract mixin class _$Sub2FailureCopyWith<T1, T2, $Res> implements $SubState2CopyWith<T1, T2, $Res> {
  factory _$Sub2FailureCopyWith(_Sub2Failure<T1, T2> value, $Res Function(_Sub2Failure<T1, T2>) _then) = __$Sub2FailureCopyWithImpl;
  @useResult
  $Res call({String error, bool show});
}

/// @nodoc
class __$Sub2FailureCopyWithImpl<T1, T2, $Res> implements _$Sub2FailureCopyWith<T1, T2, $Res> {
  __$Sub2FailureCopyWithImpl(this._self, this._then);

  final _Sub2Failure<T1, T2> _self;
  final $Res Function(_Sub2Failure<T1, T2>) _then;

  /// Create a copy of SubState2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? show = null,
  }) {
    return _then(_Sub2Failure<T1, T2>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      show: null == show
          ? _self.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$SubState3<T1, T2, T3> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SubState3<T1, T2, T3>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState3<$T1, $T2, $T3>()';
  }
}

/// @nodoc
class $SubState3CopyWith<T1, T2, T3, $Res> {
  $SubState3CopyWith(SubState3<T1, T2, T3> _, $Res Function(SubState3<T1, T2, T3>) __);
}

/// Adds pattern-matching-related methods to [SubState3].
extension SubState3Patterns<T1, T2, T3> on SubState3<T1, T2, T3> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Sub3Initial<T1, T2, T3> value)? initial,
    TResult Function(_Sub3Loading<T1, T2, T3> value)? loading,
    TResult Function(_Sub3Success<T1, T2, T3> value)? success,
    TResult Function(_Sub3Failure<T1, T2, T3> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub3Initial() when initial != null:
        return initial(_that);
      case _Sub3Loading() when loading != null:
        return loading(_that);
      case _Sub3Success() when success != null:
        return success(_that);
      case _Sub3Failure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Sub3Initial<T1, T2, T3> value) initial,
    required TResult Function(_Sub3Loading<T1, T2, T3> value) loading,
    required TResult Function(_Sub3Success<T1, T2, T3> value) success,
    required TResult Function(_Sub3Failure<T1, T2, T3> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub3Initial():
        return initial(_that);
      case _Sub3Loading():
        return loading(_that);
      case _Sub3Success():
        return success(_that);
      case _Sub3Failure():
        return failure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Sub3Initial<T1, T2, T3> value)? initial,
    TResult? Function(_Sub3Loading<T1, T2, T3> value)? loading,
    TResult? Function(_Sub3Success<T1, T2, T3> value)? success,
    TResult? Function(_Sub3Failure<T1, T2, T3> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub3Initial() when initial != null:
        return initial(_that);
      case _Sub3Loading() when loading != null:
        return loading(_that);
      case _Sub3Success() when success != null:
        return success(_that);
      case _Sub3Failure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T1 data1, T2 data2, T3 data3)? success,
    TResult Function(String error, bool show)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub3Initial() when initial != null:
        return initial();
      case _Sub3Loading() when loading != null:
        return loading();
      case _Sub3Success() when success != null:
        return success(_that.data1, _that.data2, _that.data3);
      case _Sub3Failure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T1 data1, T2 data2, T3 data3) success,
    required TResult Function(String error, bool show) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub3Initial():
        return initial();
      case _Sub3Loading():
        return loading();
      case _Sub3Success():
        return success(_that.data1, _that.data2, _that.data3);
      case _Sub3Failure():
        return failure(_that.error, _that.show);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T1 data1, T2 data2, T3 data3)? success,
    TResult? Function(String error, bool show)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub3Initial() when initial != null:
        return initial();
      case _Sub3Loading() when loading != null:
        return loading();
      case _Sub3Success() when success != null:
        return success(_that.data1, _that.data2, _that.data3);
      case _Sub3Failure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub3Initial<T1, T2, T3> extends SubState3<T1, T2, T3> {
  const _Sub3Initial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub3Initial<T1, T2, T3>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState3<$T1, $T2, $T3>.initial()';
  }
}

/// @nodoc

class _Sub3Loading<T1, T2, T3> extends SubState3<T1, T2, T3> {
  const _Sub3Loading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub3Loading<T1, T2, T3>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState3<$T1, $T2, $T3>.loading()';
  }
}

/// @nodoc

class _Sub3Success<T1, T2, T3> extends SubState3<T1, T2, T3> {
  const _Sub3Success(this.data1, this.data2, this.data3) : super._();

  final T1 data1;
  final T2 data2;
  final T3 data3;

  /// Create a copy of SubState3
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub3SuccessCopyWith<T1, T2, T3, _Sub3Success<T1, T2, T3>> get copyWith => __$Sub3SuccessCopyWithImpl<T1, T2, T3, _Sub3Success<T1, T2, T3>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub3Success<T1, T2, T3> && const DeepCollectionEquality().equals(other.data1, data1) && const DeepCollectionEquality().equals(other.data2, data2) && const DeepCollectionEquality().equals(other.data3, data3));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data1), const DeepCollectionEquality().hash(data2), const DeepCollectionEquality().hash(data3));

  @override
  String toString() {
    return 'SubState3<$T1, $T2, $T3>.success(data1: $data1, data2: $data2, data3: $data3)';
  }
}

/// @nodoc
abstract mixin class _$Sub3SuccessCopyWith<T1, T2, T3, $Res> implements $SubState3CopyWith<T1, T2, T3, $Res> {
  factory _$Sub3SuccessCopyWith(_Sub3Success<T1, T2, T3> value, $Res Function(_Sub3Success<T1, T2, T3>) _then) = __$Sub3SuccessCopyWithImpl;
  @useResult
  $Res call({T1 data1, T2 data2, T3 data3});
}

/// @nodoc
class __$Sub3SuccessCopyWithImpl<T1, T2, T3, $Res> implements _$Sub3SuccessCopyWith<T1, T2, T3, $Res> {
  __$Sub3SuccessCopyWithImpl(this._self, this._then);

  final _Sub3Success<T1, T2, T3> _self;
  final $Res Function(_Sub3Success<T1, T2, T3>) _then;

  /// Create a copy of SubState3
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data1 = freezed,
    Object? data2 = freezed,
    Object? data3 = freezed,
  }) {
    return _then(_Sub3Success<T1, T2, T3>(
      freezed == data1
          ? _self.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as T1,
      freezed == data2
          ? _self.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as T2,
      freezed == data3
          ? _self.data3
          : data3 // ignore: cast_nullable_to_non_nullable
              as T3,
    ));
  }
}

/// @nodoc

class _Sub3Failure<T1, T2, T3> extends SubState3<T1, T2, T3> {
  const _Sub3Failure(this.error, {this.show = true}) : super._();

  final String error;
  @JsonKey()
  final bool show;

  /// Create a copy of SubState3
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub3FailureCopyWith<T1, T2, T3, _Sub3Failure<T1, T2, T3>> get copyWith => __$Sub3FailureCopyWithImpl<T1, T2, T3, _Sub3Failure<T1, T2, T3>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub3Failure<T1, T2, T3> && (identical(other.error, error) || other.error == error) && (identical(other.show, show) || other.show == show));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, show);

  @override
  String toString() {
    return 'SubState3<$T1, $T2, $T3>.failure(error: $error, show: $show)';
  }
}

/// @nodoc
abstract mixin class _$Sub3FailureCopyWith<T1, T2, T3, $Res> implements $SubState3CopyWith<T1, T2, T3, $Res> {
  factory _$Sub3FailureCopyWith(_Sub3Failure<T1, T2, T3> value, $Res Function(_Sub3Failure<T1, T2, T3>) _then) = __$Sub3FailureCopyWithImpl;
  @useResult
  $Res call({String error, bool show});
}

/// @nodoc
class __$Sub3FailureCopyWithImpl<T1, T2, T3, $Res> implements _$Sub3FailureCopyWith<T1, T2, T3, $Res> {
  __$Sub3FailureCopyWithImpl(this._self, this._then);

  final _Sub3Failure<T1, T2, T3> _self;
  final $Res Function(_Sub3Failure<T1, T2, T3>) _then;

  /// Create a copy of SubState3
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? show = null,
  }) {
    return _then(_Sub3Failure<T1, T2, T3>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      show: null == show
          ? _self.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$SubState4<T1, T2, T3, T4> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SubState4<T1, T2, T3, T4>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState4<$T1, $T2, $T3, $T4>()';
  }
}

/// @nodoc
class $SubState4CopyWith<T1, T2, T3, T4, $Res> {
  $SubState4CopyWith(SubState4<T1, T2, T3, T4> _, $Res Function(SubState4<T1, T2, T3, T4>) __);
}

/// Adds pattern-matching-related methods to [SubState4].
extension SubState4Patterns<T1, T2, T3, T4> on SubState4<T1, T2, T3, T4> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Sub4Initial<T1, T2, T3, T4> value)? initial,
    TResult Function(_Sub4Loading<T1, T2, T3, T4> value)? loading,
    TResult Function(_Sub4Success<T1, T2, T3, T4> value)? success,
    TResult Function(_Sub4Failure<T1, T2, T3, T4> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub4Initial() when initial != null:
        return initial(_that);
      case _Sub4Loading() when loading != null:
        return loading(_that);
      case _Sub4Success() when success != null:
        return success(_that);
      case _Sub4Failure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Sub4Initial<T1, T2, T3, T4> value) initial,
    required TResult Function(_Sub4Loading<T1, T2, T3, T4> value) loading,
    required TResult Function(_Sub4Success<T1, T2, T3, T4> value) success,
    required TResult Function(_Sub4Failure<T1, T2, T3, T4> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub4Initial():
        return initial(_that);
      case _Sub4Loading():
        return loading(_that);
      case _Sub4Success():
        return success(_that);
      case _Sub4Failure():
        return failure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Sub4Initial<T1, T2, T3, T4> value)? initial,
    TResult? Function(_Sub4Loading<T1, T2, T3, T4> value)? loading,
    TResult? Function(_Sub4Success<T1, T2, T3, T4> value)? success,
    TResult? Function(_Sub4Failure<T1, T2, T3, T4> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub4Initial() when initial != null:
        return initial(_that);
      case _Sub4Loading() when loading != null:
        return loading(_that);
      case _Sub4Success() when success != null:
        return success(_that);
      case _Sub4Failure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T1 data1, T2 data2, T3 data3, T4 data4)? success,
    TResult Function(String error, bool show)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub4Initial() when initial != null:
        return initial();
      case _Sub4Loading() when loading != null:
        return loading();
      case _Sub4Success() when success != null:
        return success(_that.data1, _that.data2, _that.data3, _that.data4);
      case _Sub4Failure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T1 data1, T2 data2, T3 data3, T4 data4) success,
    required TResult Function(String error, bool show) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub4Initial():
        return initial();
      case _Sub4Loading():
        return loading();
      case _Sub4Success():
        return success(_that.data1, _that.data2, _that.data3, _that.data4);
      case _Sub4Failure():
        return failure(_that.error, _that.show);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T1 data1, T2 data2, T3 data3, T4 data4)? success,
    TResult? Function(String error, bool show)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub4Initial() when initial != null:
        return initial();
      case _Sub4Loading() when loading != null:
        return loading();
      case _Sub4Success() when success != null:
        return success(_that.data1, _that.data2, _that.data3, _that.data4);
      case _Sub4Failure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub4Initial<T1, T2, T3, T4> extends SubState4<T1, T2, T3, T4> {
  const _Sub4Initial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub4Initial<T1, T2, T3, T4>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState4<$T1, $T2, $T3, $T4>.initial()';
  }
}

/// @nodoc

class _Sub4Loading<T1, T2, T3, T4> extends SubState4<T1, T2, T3, T4> {
  const _Sub4Loading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub4Loading<T1, T2, T3, T4>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState4<$T1, $T2, $T3, $T4>.loading()';
  }
}

/// @nodoc

class _Sub4Success<T1, T2, T3, T4> extends SubState4<T1, T2, T3, T4> {
  const _Sub4Success(this.data1, this.data2, this.data3, this.data4) : super._();

  final T1 data1;
  final T2 data2;
  final T3 data3;
  final T4 data4;

  /// Create a copy of SubState4
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub4SuccessCopyWith<T1, T2, T3, T4, _Sub4Success<T1, T2, T3, T4>> get copyWith => __$Sub4SuccessCopyWithImpl<T1, T2, T3, T4, _Sub4Success<T1, T2, T3, T4>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub4Success<T1, T2, T3, T4> &&
            const DeepCollectionEquality().equals(other.data1, data1) &&
            const DeepCollectionEquality().equals(other.data2, data2) &&
            const DeepCollectionEquality().equals(other.data3, data3) &&
            const DeepCollectionEquality().equals(other.data4, data4));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data1), const DeepCollectionEquality().hash(data2), const DeepCollectionEquality().hash(data3), const DeepCollectionEquality().hash(data4));

  @override
  String toString() {
    return 'SubState4<$T1, $T2, $T3, $T4>.success(data1: $data1, data2: $data2, data3: $data3, data4: $data4)';
  }
}

/// @nodoc
abstract mixin class _$Sub4SuccessCopyWith<T1, T2, T3, T4, $Res> implements $SubState4CopyWith<T1, T2, T3, T4, $Res> {
  factory _$Sub4SuccessCopyWith(_Sub4Success<T1, T2, T3, T4> value, $Res Function(_Sub4Success<T1, T2, T3, T4>) _then) = __$Sub4SuccessCopyWithImpl;
  @useResult
  $Res call({T1 data1, T2 data2, T3 data3, T4 data4});
}

/// @nodoc
class __$Sub4SuccessCopyWithImpl<T1, T2, T3, T4, $Res> implements _$Sub4SuccessCopyWith<T1, T2, T3, T4, $Res> {
  __$Sub4SuccessCopyWithImpl(this._self, this._then);

  final _Sub4Success<T1, T2, T3, T4> _self;
  final $Res Function(_Sub4Success<T1, T2, T3, T4>) _then;

  /// Create a copy of SubState4
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data1 = freezed,
    Object? data2 = freezed,
    Object? data3 = freezed,
    Object? data4 = freezed,
  }) {
    return _then(_Sub4Success<T1, T2, T3, T4>(
      freezed == data1
          ? _self.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as T1,
      freezed == data2
          ? _self.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as T2,
      freezed == data3
          ? _self.data3
          : data3 // ignore: cast_nullable_to_non_nullable
              as T3,
      freezed == data4
          ? _self.data4
          : data4 // ignore: cast_nullable_to_non_nullable
              as T4,
    ));
  }
}

/// @nodoc

class _Sub4Failure<T1, T2, T3, T4> extends SubState4<T1, T2, T3, T4> {
  const _Sub4Failure(this.error, {this.show = true}) : super._();

  final String error;
  @JsonKey()
  final bool show;

  /// Create a copy of SubState4
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub4FailureCopyWith<T1, T2, T3, T4, _Sub4Failure<T1, T2, T3, T4>> get copyWith => __$Sub4FailureCopyWithImpl<T1, T2, T3, T4, _Sub4Failure<T1, T2, T3, T4>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub4Failure<T1, T2, T3, T4> && (identical(other.error, error) || other.error == error) && (identical(other.show, show) || other.show == show));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, show);

  @override
  String toString() {
    return 'SubState4<$T1, $T2, $T3, $T4>.failure(error: $error, show: $show)';
  }
}

/// @nodoc
abstract mixin class _$Sub4FailureCopyWith<T1, T2, T3, T4, $Res> implements $SubState4CopyWith<T1, T2, T3, T4, $Res> {
  factory _$Sub4FailureCopyWith(_Sub4Failure<T1, T2, T3, T4> value, $Res Function(_Sub4Failure<T1, T2, T3, T4>) _then) = __$Sub4FailureCopyWithImpl;
  @useResult
  $Res call({String error, bool show});
}

/// @nodoc
class __$Sub4FailureCopyWithImpl<T1, T2, T3, T4, $Res> implements _$Sub4FailureCopyWith<T1, T2, T3, T4, $Res> {
  __$Sub4FailureCopyWithImpl(this._self, this._then);

  final _Sub4Failure<T1, T2, T3, T4> _self;
  final $Res Function(_Sub4Failure<T1, T2, T3, T4>) _then;

  /// Create a copy of SubState4
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? show = null,
  }) {
    return _then(_Sub4Failure<T1, T2, T3, T4>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      show: null == show
          ? _self.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$SubState5<T1, T2, T3, T4, T5> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SubState5<T1, T2, T3, T4, T5>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState5<$T1, $T2, $T3, $T4, $T5>()';
  }
}

/// @nodoc
class $SubState5CopyWith<T1, T2, T3, T4, T5, $Res> {
  $SubState5CopyWith(SubState5<T1, T2, T3, T4, T5> _, $Res Function(SubState5<T1, T2, T3, T4, T5>) __);
}

/// Adds pattern-matching-related methods to [SubState5].
extension SubState5Patterns<T1, T2, T3, T4, T5> on SubState5<T1, T2, T3, T4, T5> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Sub5Initial<T1, T2, T3, T4, T5> value)? initial,
    TResult Function(_Sub5Loading<T1, T2, T3, T4, T5> value)? loading,
    TResult Function(_Sub5Success<T1, T2, T3, T4, T5> value)? success,
    TResult Function(_Sub5Failure<T1, T2, T3, T4, T5> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub5Initial() when initial != null:
        return initial(_that);
      case _Sub5Loading() when loading != null:
        return loading(_that);
      case _Sub5Success() when success != null:
        return success(_that);
      case _Sub5Failure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Sub5Initial<T1, T2, T3, T4, T5> value) initial,
    required TResult Function(_Sub5Loading<T1, T2, T3, T4, T5> value) loading,
    required TResult Function(_Sub5Success<T1, T2, T3, T4, T5> value) success,
    required TResult Function(_Sub5Failure<T1, T2, T3, T4, T5> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub5Initial():
        return initial(_that);
      case _Sub5Loading():
        return loading(_that);
      case _Sub5Success():
        return success(_that);
      case _Sub5Failure():
        return failure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Sub5Initial<T1, T2, T3, T4, T5> value)? initial,
    TResult? Function(_Sub5Loading<T1, T2, T3, T4, T5> value)? loading,
    TResult? Function(_Sub5Success<T1, T2, T3, T4, T5> value)? success,
    TResult? Function(_Sub5Failure<T1, T2, T3, T4, T5> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub5Initial() when initial != null:
        return initial(_that);
      case _Sub5Loading() when loading != null:
        return loading(_that);
      case _Sub5Success() when success != null:
        return success(_that);
      case _Sub5Failure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T1 data1, T2 data2, T3 data3, T4 data4, T5 data5)? success,
    TResult Function(String error, bool show)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub5Initial() when initial != null:
        return initial();
      case _Sub5Loading() when loading != null:
        return loading();
      case _Sub5Success() when success != null:
        return success(_that.data1, _that.data2, _that.data3, _that.data4, _that.data5);
      case _Sub5Failure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T1 data1, T2 data2, T3 data3, T4 data4, T5 data5) success,
    required TResult Function(String error, bool show) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub5Initial():
        return initial();
      case _Sub5Loading():
        return loading();
      case _Sub5Success():
        return success(_that.data1, _that.data2, _that.data3, _that.data4, _that.data5);
      case _Sub5Failure():
        return failure(_that.error, _that.show);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T1 data1, T2 data2, T3 data3, T4 data4, T5 data5)? success,
    TResult? Function(String error, bool show)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Sub5Initial() when initial != null:
        return initial();
      case _Sub5Loading() when loading != null:
        return loading();
      case _Sub5Success() when success != null:
        return success(_that.data1, _that.data2, _that.data3, _that.data4, _that.data5);
      case _Sub5Failure() when failure != null:
        return failure(_that.error, _that.show);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub5Initial<T1, T2, T3, T4, T5> extends SubState5<T1, T2, T3, T4, T5> {
  const _Sub5Initial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub5Initial<T1, T2, T3, T4, T5>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState5<$T1, $T2, $T3, $T4, $T5>.initial()';
  }
}

/// @nodoc

class _Sub5Loading<T1, T2, T3, T4, T5> extends SubState5<T1, T2, T3, T4, T5> {
  const _Sub5Loading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub5Loading<T1, T2, T3, T4, T5>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubState5<$T1, $T2, $T3, $T4, $T5>.loading()';
  }
}

/// @nodoc

class _Sub5Success<T1, T2, T3, T4, T5> extends SubState5<T1, T2, T3, T4, T5> {
  const _Sub5Success(this.data1, this.data2, this.data3, this.data4, this.data5) : super._();

  final T1 data1;
  final T2 data2;
  final T3 data3;
  final T4 data4;
  final T5 data5;

  /// Create a copy of SubState5
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub5SuccessCopyWith<T1, T2, T3, T4, T5, _Sub5Success<T1, T2, T3, T4, T5>> get copyWith => __$Sub5SuccessCopyWithImpl<T1, T2, T3, T4, T5, _Sub5Success<T1, T2, T3, T4, T5>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub5Success<T1, T2, T3, T4, T5> &&
            const DeepCollectionEquality().equals(other.data1, data1) &&
            const DeepCollectionEquality().equals(other.data2, data2) &&
            const DeepCollectionEquality().equals(other.data3, data3) &&
            const DeepCollectionEquality().equals(other.data4, data4) &&
            const DeepCollectionEquality().equals(other.data5, data5));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data1), const DeepCollectionEquality().hash(data2), const DeepCollectionEquality().hash(data3), const DeepCollectionEquality().hash(data4), const DeepCollectionEquality().hash(data5));

  @override
  String toString() {
    return 'SubState5<$T1, $T2, $T3, $T4, $T5>.success(data1: $data1, data2: $data2, data3: $data3, data4: $data4, data5: $data5)';
  }
}

/// @nodoc
abstract mixin class _$Sub5SuccessCopyWith<T1, T2, T3, T4, T5, $Res> implements $SubState5CopyWith<T1, T2, T3, T4, T5, $Res> {
  factory _$Sub5SuccessCopyWith(_Sub5Success<T1, T2, T3, T4, T5> value, $Res Function(_Sub5Success<T1, T2, T3, T4, T5>) _then) = __$Sub5SuccessCopyWithImpl;
  @useResult
  $Res call({T1 data1, T2 data2, T3 data3, T4 data4, T5 data5});
}

/// @nodoc
class __$Sub5SuccessCopyWithImpl<T1, T2, T3, T4, T5, $Res> implements _$Sub5SuccessCopyWith<T1, T2, T3, T4, T5, $Res> {
  __$Sub5SuccessCopyWithImpl(this._self, this._then);

  final _Sub5Success<T1, T2, T3, T4, T5> _self;
  final $Res Function(_Sub5Success<T1, T2, T3, T4, T5>) _then;

  /// Create a copy of SubState5
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data1 = freezed,
    Object? data2 = freezed,
    Object? data3 = freezed,
    Object? data4 = freezed,
    Object? data5 = freezed,
  }) {
    return _then(_Sub5Success<T1, T2, T3, T4, T5>(
      freezed == data1
          ? _self.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as T1,
      freezed == data2
          ? _self.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as T2,
      freezed == data3
          ? _self.data3
          : data3 // ignore: cast_nullable_to_non_nullable
              as T3,
      freezed == data4
          ? _self.data4
          : data4 // ignore: cast_nullable_to_non_nullable
              as T4,
      freezed == data5
          ? _self.data5
          : data5 // ignore: cast_nullable_to_non_nullable
              as T5,
    ));
  }
}

/// @nodoc

class _Sub5Failure<T1, T2, T3, T4, T5> extends SubState5<T1, T2, T3, T4, T5> {
  const _Sub5Failure(this.error, {this.show = true}) : super._();

  final String error;
  @JsonKey()
  final bool show;

  /// Create a copy of SubState5
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub5FailureCopyWith<T1, T2, T3, T4, T5, _Sub5Failure<T1, T2, T3, T4, T5>> get copyWith => __$Sub5FailureCopyWithImpl<T1, T2, T3, T4, T5, _Sub5Failure<T1, T2, T3, T4, T5>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Sub5Failure<T1, T2, T3, T4, T5> && (identical(other.error, error) || other.error == error) && (identical(other.show, show) || other.show == show));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, show);

  @override
  String toString() {
    return 'SubState5<$T1, $T2, $T3, $T4, $T5>.failure(error: $error, show: $show)';
  }
}

/// @nodoc
abstract mixin class _$Sub5FailureCopyWith<T1, T2, T3, T4, T5, $Res> implements $SubState5CopyWith<T1, T2, T3, T4, T5, $Res> {
  factory _$Sub5FailureCopyWith(_Sub5Failure<T1, T2, T3, T4, T5> value, $Res Function(_Sub5Failure<T1, T2, T3, T4, T5>) _then) = __$Sub5FailureCopyWithImpl;
  @useResult
  $Res call({String error, bool show});
}

/// @nodoc
class __$Sub5FailureCopyWithImpl<T1, T2, T3, T4, T5, $Res> implements _$Sub5FailureCopyWith<T1, T2, T3, T4, T5, $Res> {
  __$Sub5FailureCopyWithImpl(this._self, this._then);

  final _Sub5Failure<T1, T2, T3, T4, T5> _self;
  final $Res Function(_Sub5Failure<T1, T2, T3, T4, T5>) _then;

  /// Create a copy of SubState5
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? show = null,
  }) {
    return _then(_Sub5Failure<T1, T2, T3, T4, T5>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      show: null == show
          ? _self.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
