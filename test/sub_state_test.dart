import 'package:sub_state/sub_state.dart';
import 'package:test/test.dart';

void main() {
  group('SubState (single value)', () {
    test('factories produce the matching variant', () {
      expect(const SubState<int, String>.initial(), isA<SubInitial>());
      expect(const SubState<int, String>.loading(), isA<SubLoading>());
      expect(const SubState<int, String>.success(1), isA<SubSuccess>());
      expect(const SubState<int, String>.failure('x'), isA<SubFailure>());
    });

    test('is* getters are mutually exclusive', () {
      const states = <SubState<int, String>>[
        SubState.initial(),
        SubState.loading(),
        SubState.success(1),
        SubState.failure('x'),
      ];
      expect(states.map((s) => s.isInitial), [true, false, false, false]);
      expect(states.map((s) => s.isLoading), [false, true, false, false]);
      expect(states.map((s) => s.isSuccess), [false, false, true, false]);
      expect(states.map((s) => s.isFailure), [false, false, false, true]);
    });

    test('dataOrNull / errorOrNull', () {
      expect(const SubState<int, String>.success(7).dataOrNull, 7);
      expect(const SubState<int, String>.loading().dataOrNull, isNull);
      expect(const SubState<int, String>.failure('boom').errorOrNull, 'boom');
      expect(const SubState<int, String>.success(7).errorOrNull, isNull);
    });

    test('when is exhaustive', () {
      String describe(SubState<int, String> s) => s.when(
            initial: () => 'initial',
            loading: () => 'loading',
            success: (data) => 'success:$data',
            failure: (error) => 'failure:$error',
          );
      expect(describe(const SubState.initial()), 'initial');
      expect(describe(const SubState.loading()), 'loading');
      expect(describe(const SubState.success(9)), 'success:9');
      expect(describe(const SubState.failure('e')), 'failure:e');
    });

    test('maybeWhen falls back to orElse', () {
      expect(
        const SubState<int, String>.loading().maybeWhen(success: (d) => 'd', orElse: () => 'else'),
        'else',
      );
      expect(
        const SubState<int, String>.success(3).maybeWhen(success: (d) => 'd$d', orElse: () => 'else'),
        'd3',
      );
    });

    test('whenOrNull returns null for unhandled', () {
      expect(
        const SubState<int, String>.loading().whenOrNull(success: (d) => d),
        isNull,
      );
      expect(
        const SubState<int, String>.success(5).whenOrNull(success: (d) => d),
        5,
      );
    });

    test('map / maybeMap / mapOrNull expose the raw variant', () {
      final s = const SubState<int, String>.success(2);
      expect(
        s.map(
          initial: (_) => 'i',
          loading: (_) => 'l',
          success: (v) => 'got ${v.data}',
          failure: (_) => 'f',
        ),
        'got 2',
      );
      expect(s.maybeMap(orElse: () => 'else'), 'else');
      expect(s.maybeMap(success: (v) => v.data, orElse: () => -1), 2);
      expect(s.mapOrNull(loading: (_) => 'l'), isNull);
      expect(s.mapOrNull(success: (v) => v.data), 2);
    });

    test('native switch pattern matching is exhaustive', () {
      String label(SubState<int, String> s) => switch (s) {
            SubInitial() => 'i',
            SubLoading() => 'l',
            SubSuccess(:final data) => 'd$data',
            SubFailure(:final error) => 'e$error',
          };
      expect(label(const SubState.success(8)), 'd8');
      expect(label(const SubState.failure('z')), 'ez');
    });

    test('copyWith on success and failure', () {
      const s = SubSuccess<int, String>(1);
      expect(s.copyWith(data: 2), const SubSuccess<int, String>(2));
      expect(s.copyWith(), s);
      const f = SubFailure<int, String>('a');
      expect(f.copyWith(error: 'b'), const SubFailure<int, String>('b'));
    });

    test('value equality and hashCode', () {
      expect(
        const SubState<int, String>.success(1),
        const SubState<int, String>.success(1),
      );
      expect(
        const SubState<int, String>.success(1).hashCode,
        const SubState<int, String>.success(1).hashCode,
      );
      expect(
        const SubState<int, String>.success(1),
        isNot(const SubState<int, String>.success(2)),
      );
      expect(
        const SubState<int, String>.initial(),
        const SubState<int, String>.initial(),
      );
      expect(
        const SubState<int, String>.initial(),
        isNot(const SubState<int, String>.loading()),
      );
    });

    test('deep collection equality on success data', () {
      expect(
        SubState<List<int>, String>.success([1, 2, 3]),
        SubState<List<int>, String>.success([1, 2, 3]),
      );
      expect(
        SubState<List<int>, String>.success([1, 2, 3]).hashCode,
        SubState<List<int>, String>.success([1, 2, 3]).hashCode,
      );
    });

    test('toString format', () {
      expect(
        const SubState<int, String>.success(5).toString(),
        'SubState<int, String>.success(data: 5)',
      );
      expect(
        const SubState<int, String>.initial().toString(),
        'SubState<int, String>.initial()',
      );
    });

    test('supports nullable success type via copyWith', () {
      const s = SubSuccess<int?, String>(1);
      expect(s.copyWith(data: null).data, isNull);
      expect(s.copyWith().data, 1);
    });
  });

  group('SubState2', () {
    const s = SubState2<int, String, Object>.success(1, 'a');

    test('dataNOrNull', () {
      expect(s.data1OrNull, 1);
      expect(s.data2OrNull, 'a');
      expect(s.errorOrNull, isNull);
    });

    test('when receives both values', () {
      expect(
        s.when(
          initial: () => '',
          loading: () => '',
          success: (a, b) => '$a-$b',
          failure: (_) => '',
        ),
        '1-a',
      );
    });

    test('copyWith replaces selected fields', () {
      expect((s as Sub2Success).copyWith(data2: 'b'), const Sub2Success<int, String, Object>(1, 'b'));
    });

    test('equality and toString', () {
      expect(s, const SubState2<int, String, Object>.success(1, 'a'));
      expect(
        s.toString(),
        'SubState2<int, String, Object>.success(data1: 1, data2: a)',
      );
    });
  });

  group('SubState3', () {
    const s = SubState3<int, int, int, String>.success(1, 2, 3);

    test('dataNOrNull', () {
      expect(s.data1OrNull, 1);
      expect(s.data2OrNull, 2);
      expect(s.data3OrNull, 3);
    });

    // Regression: SubState3.isFailure once checked the wrong variant type and
    // always returned false. Guard against that ever coming back.
    test('isFailure is correct for the failure state', () {
      const f = SubState3<int, int, int, String>.failure('boom');
      expect(f.isFailure, isTrue);
      expect(f.isSuccess, isFalse);
      expect(s.isFailure, isFalse);
      expect(s.isSuccess, isTrue);
    });

    test('when receives three values', () {
      expect(
        s.when(
          initial: () => '',
          loading: () => '',
          success: (a, b, c) => '$a$b$c',
          failure: (_) => '',
        ),
        '123',
      );
    });
  });

  group('SubState4', () {
    const s = SubState4<int, int, int, int, String>.success(1, 2, 3, 4);

    test('dataNOrNull and when', () {
      expect([s.data1OrNull, s.data2OrNull, s.data3OrNull, s.data4OrNull], [1, 2, 3, 4]);
      expect(
        s.when(
          initial: () => '',
          loading: () => '',
          success: (a, b, c, d) => '$a$b$c$d',
          failure: (_) => '',
        ),
        '1234',
      );
    });

    test('copyWith', () {
      expect(
        (s as Sub4Success).copyWith(data4: 9),
        const Sub4Success<int, int, int, int, String>(1, 2, 3, 9),
      );
    });
  });

  group('SubState5', () {
    const s = SubState5<int, int, int, int, int, String>.success(1, 2, 3, 4, 5);

    test('dataNOrNull and when', () {
      expect(
        [
          s.data1OrNull,
          s.data2OrNull,
          s.data3OrNull,
          s.data4OrNull,
          s.data5OrNull,
        ],
        [1, 2, 3, 4, 5],
      );
      expect(
        s.when(
          initial: () => '',
          loading: () => '',
          success: (a, b, c, d, e) => '$a$b$c$d$e',
          failure: (_) => '',
        ),
        '12345',
      );
    });

    test('failure state', () {
      const f = SubState5<int, int, int, int, int, String>.failure('boom');
      expect(f.isFailure, isTrue);
      expect(f.errorOrNull, 'boom');
      expect(
        f.toString(),
        'SubState5<int, int, int, int, int, String>.failure(error: boom)',
      );
    });
  });
}
