// A self-contained, pure-Dart tour of `sub_state`.
//
// Run it with:
//   dart run example/sub_state_example.dart
// ignore_for_file: avoid_print
import 'package:sub_state/sub_state.dart';

Future<void> main() async {
  // 1. Every state, rendered with native exhaustive pattern matching.
  const states = <SubState<int, String>>[
    SubState.initial(),
    SubState.loading(),
    SubState.success(42),
    SubState.failure('network unreachable'),
  ];
  for (final state in states) {
    print(render(state));
  }

  // 2. A simulated async operation that resolves to a SubState.
  print(render(await fetch(succeed: true)));
  print(render(await fetch(succeed: false)));

  // 3. Null-safe accessors and copyWith.
  const ok = SubState<int, String>.success(1);
  print('dataOrNull: ${ok.dataOrNull}'); // -> 1
  final bumped = (ok as SubSuccess<int, String>).copyWith(data: 2);
  print('after copyWith: ${bumped.data}'); // -> 2

  // 4. Two success values at once via SubState2.
  final profile = SubState2<String, int, String>.success('Ada', 36);
  final greeting = profile.when(
    initial: () => 'idle',
    loading: () => 'loading…',
    success: (name, age) => '$name is $age',
    failure: (error) => 'error: $error',
  );
  print(greeting); // -> Ada is 36
}

/// Renders any [SubState] using native, compile-time-exhaustive matching.
String render(SubState<int, String> state) => switch (state) {
      SubInitial() => '⚪ initial',
      SubLoading() => '⏳ loading…',
      SubSuccess(:final data) => '✅ success: $data',
      SubFailure(:final error) => '❌ failure: $error',
    };

/// Simulates an async call that ends in either success or failure.
Future<SubState<int, String>> fetch({required bool succeed}) async {
  await Future<void>.delayed(const Duration(milliseconds: 10));
  return succeed ? const SubState.success(200) : const SubState.failure('timeout');
}
