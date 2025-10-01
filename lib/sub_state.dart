// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

abstract class SubStateCubit<T> extends Cubit<SubState<T>> {
  SubStateCubit() : super(SubState<T>.initial());

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

class SubStateProviderBuilder<T extends Cubit<SubState<S>>, S>
    extends StatelessWidget {
  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, SubState<S> state) builder;
  final bool Function(SubState<S> previous, SubState<S> current)? buildWhen;
  final bool Function(SubState<S> previous, SubState<S> current)? listenWhen;
  final void Function(BuildContext context, SubState<S> state)? listener;

  const SubStateProviderBuilder({
    super.key,
    required this.create,
    required this.builder,
    this.buildWhen,
    this.listenWhen,
    this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: listener == null
          ? BlocBuilder<T, SubState<S>>(
              buildWhen: buildWhen,
              builder: builder,
            )
          : BlocConsumer<T, SubState<S>>(
              listenWhen: listenWhen,
              listener: listener!,
              buildWhen: buildWhen,
              builder: builder,
            ),
    );
  }
}

class SubStateBuilder<T extends Cubit<SubState<S>>, S> extends StatelessWidget {
  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, SubState<S> state) builder;
  final bool Function(SubState<S> previous, SubState<S> current)? buildWhen;
  final bool Function(SubState<S> previous, SubState<S> current)? listenWhen;
  final void Function(BuildContext context, SubState<S> state)? listener;

  const SubStateBuilder({
    super.key,
    required this.builder,
    this.buildWhen,
    this.listenWhen,
    this.listener,
    required this.create,
  });

  @override
  Widget build(BuildContext context) {
    return listener == null
        ? BlocBuilder<T, SubState<S>>(
            buildWhen: buildWhen,
            builder: builder,
          )
        : BlocConsumer<T, SubState<S>>(
            listenWhen: listenWhen,
            listener: listener!,
            buildWhen: buildWhen,
            builder: builder,
          );
  }
}
