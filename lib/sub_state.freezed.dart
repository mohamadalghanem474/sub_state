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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubState<TSuccess>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubState<$TSuccess>()';
}


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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SubSuccess<TSuccess> value)?  success,TResult Function( _SubLoading<TSuccess> value)?  loading,TResult Function( _SubFailure<TSuccess> value)?  failure,TResult Function( _SubInitial<TSuccess> value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubSuccess() when success != null:
return success(_that);case _SubLoading() when loading != null:
return loading(_that);case _SubFailure() when failure != null:
return failure(_that);case _SubInitial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SubSuccess<TSuccess> value)  success,required TResult Function( _SubLoading<TSuccess> value)  loading,required TResult Function( _SubFailure<TSuccess> value)  failure,required TResult Function( _SubInitial<TSuccess> value)  initial,}){
final _that = this;
switch (_that) {
case _SubSuccess():
return success(_that);case _SubLoading():
return loading(_that);case _SubFailure():
return failure(_that);case _SubInitial():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SubSuccess<TSuccess> value)?  success,TResult? Function( _SubLoading<TSuccess> value)?  loading,TResult? Function( _SubFailure<TSuccess> value)?  failure,TResult? Function( _SubInitial<TSuccess> value)?  initial,}){
final _that = this;
switch (_that) {
case _SubSuccess() when success != null:
return success(_that);case _SubLoading() when loading != null:
return loading(_that);case _SubFailure() when failure != null:
return failure(_that);case _SubInitial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TSuccess data)?  success,TResult Function()?  loading,TResult Function( String error)?  failure,TResult Function()?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubSuccess() when success != null:
return success(_that.data);case _SubLoading() when loading != null:
return loading();case _SubFailure() when failure != null:
return failure(_that.error);case _SubInitial() when initial != null:
return initial();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TSuccess data)  success,required TResult Function()  loading,required TResult Function( String error)  failure,required TResult Function()  initial,}) {final _that = this;
switch (_that) {
case _SubSuccess():
return success(_that.data);case _SubLoading():
return loading();case _SubFailure():
return failure(_that.error);case _SubInitial():
return initial();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TSuccess data)?  success,TResult? Function()?  loading,TResult? Function( String error)?  failure,TResult? Function()?  initial,}) {final _that = this;
switch (_that) {
case _SubSuccess() when success != null:
return success(_that.data);case _SubLoading() when loading != null:
return loading();case _SubFailure() when failure != null:
return failure(_that.error);case _SubInitial() when initial != null:
return initial();case _:
  return null;

}
}

}

/// @nodoc


class _SubSuccess<TSuccess> extends SubState<TSuccess> {
  const _SubSuccess(this.data): super._();
  

 final  TSuccess data;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubSuccess<TSuccess>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SubState<$TSuccess>.success(data: $data)';
}


}




/// @nodoc


class _SubLoading<TSuccess> extends SubState<TSuccess> {
  const _SubLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubLoading<TSuccess>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubState<$TSuccess>.loading()';
}


}




/// @nodoc


class _SubFailure<TSuccess> extends SubState<TSuccess> {
  const _SubFailure(this.error): super._();
  

 final  String error;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubFailure<TSuccess>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SubState<$TSuccess>.failure(error: $error)';
}


}




/// @nodoc


class _SubInitial<TSuccess> extends SubState<TSuccess> {
  const _SubInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubInitial<TSuccess>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubState<$TSuccess>.initial()';
}


}




// dart format on
