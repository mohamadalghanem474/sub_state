# sub_state

A lightweight, type-safe state holder for Dart & Flutter.

Every async operation lives in exactly one of four states — `initial`, `loading`, `success`, or `failure` — modelled with Dart 3 [sealed] classes. You get compile-time exhaustive `switch` pattern matching for free, plus `when` / `map` / `copyWith` helpers.

---

## Table of Contents

- [Installation](#installation)
- [Core Concept](#core-concept)
- [Variants](#variants)
- [Basic Usage](#basic-usage)
- [Pattern Matching — The Right Way](#pattern-matching--the-right-way)
- [Good Practices ✅ vs Bad Practices ❌](#good-practices--vs-bad-practices-)
  - [Pattern Matching](#1-pattern-matching)
  - [State Checks](#2-state-checks)
  - [Accessing Data](#3-accessing-data)
  - [Updating Success State](#4-updating-success-state)
  - [Using Multi-Value Variants](#5-using-multi-value-variants)
- [Full API Reference](#full-api-reference)
  - [when / maybeWhen / whenOrNull](#when--maybewhen--whenornull)
  - [map / maybeMap / mapOrNull](#map--maybemap--mapornull)
  - [copyWith](#copywith)
  - [State Checks & Getters](#state-checks--getters)
- [Flutter Integration](#flutter-integration)
  - [With setState](#with-setstate)
  - [With Bloc / Cubit](#with-bloc--cubit)
  - [With Riverpod](#with-riverpod)
- [Multi-Value Variants (SubState2–5)](#multi-value-variants-substate25)
- [Error Modelling Tips](#error-modelling-tips)
- [Migrating from v1](#migrating-from-v1)

---

## Installation

```yaml
# pubspec.yaml
dependencies:
  sub_state: ^2.0.0
```

```dart
import 'package:sub_state/sub_state.dart';
```

---

## Core Concept

`SubState<TSuccess, TError>` is a sealed class. At any moment it is exactly **one** of:

| State | Factory | Meaning |
|---|---|---|
| `SubInitial` | `SubState.initial()` | Nothing has started yet |
| `SubLoading` | `SubState.loading()` | Operation is in flight |
| `SubSuccess` | `SubState.success(data)` | Completed, carrying a value |
| `SubFailure` | `SubState.failure(error)` | Failed, carrying an error |

Because the class is `sealed`, Dart's compiler verifies that every `switch` handles all four cases — no forgotten branch, no runtime surprises.

---

## Variants

Pick the variant that matches how many success values you need to carry:

| Class | Success values | Type parameters |
|---|---|---|
| `SubState<S, E>` | 1 | `<TSuccess, TError>` |
| `SubState2<T1, T2, E>` | 2 | `<T1, T2, TError>` |
| `SubState3<T1, T2, T3, E>` | 3 | `<T1, T2, T3, TError>` |
| `SubState4<T1, T2, T3, T4, E>` | 4 | `<T1, T2, T3, T4, TError>` |
| `SubState5<T1, T2, T3, T4, T5, E>` | 5 | `<T1, T2, T3, T4, T5, TError>` |

---

## Basic Usage

```dart
// 1. Declare state — typically inside a Cubit, ChangeNotifier, or StateNotifier
SubState<List<User>, String> userState = const SubState.initial();

// 2. Transition through states
Future<void> loadUsers() async {
  userState = const SubState.loading();
  notifyListeners();

  try {
    final users = await userRepository.fetchAll();
    userState = SubState.success(users);
  } catch (e) {
    userState = SubState.failure('Failed to load users: $e');
  }

  notifyListeners();
}
```

---

## Pattern Matching — The Right Way

Use `when` for exhaustive handling. The compiler enforces that every state is covered:

```dart
final widget = state.when(
  initial:  ()        => const Text('Press a button to start'),
  loading:  ()        => const CircularProgressIndicator(),
  success:  (users)   => UserListView(users: users),
  failure:  (message) => ErrorView(message: message),
);
```

Use native `switch` for even more power (destructuring, guards):

```dart
final label = switch (state) {
  SubInitial()                              => 'Idle',
  SubLoading()                              => 'Loading…',
  SubSuccess(:final data) when data.isEmpty => 'No results',
  SubSuccess(:final data)                   => '${data.length} items',
  SubFailure(:final error)                  => 'Error: $error',
};
```

---

## Good Practices ✅ vs Bad Practices ❌

### 1. Pattern Matching

**✅ Good — exhaustive `when`, compiler catches missing cases**

```dart
return state.when(
  initial:  () => const Placeholder(),
  loading:  () => const CircularProgressIndicator(),
  success:  (data) => DataWidget(data: data),
  failure:  (err)  => Text('Error: $err'),
);
```

**❌ Bad — ad-hoc `if` chain, easy to miss a state, no compile-time safety**

```dart
if (state.isLoading) {
  return const CircularProgressIndicator();
} else if (state.isSuccess) {
  return DataWidget(data: state.dataOrNull!); // ← force-unwrap, crash risk
}
// forgot initial and failure — silent bug
return const SizedBox();
```

---

**✅ Good — `maybeWhen` for intentional partial handling**

```dart
// Only care about success; everything else shows nothing
final badge = state.maybeWhen(
  success: (count) => Badge(label: '$count'),
  orElse:  ()      => null,
);
```

**❌ Bad — `whenOrNull` used where `orElse` fallback is actually needed**

```dart
// If orElse logic is non-trivial, maybeWhen is cleaner and more explicit
final badge = state.whenOrNull(
  success: (count) => Badge(label: '$count'),
);
// Silently returns null for all other states — fine only for truly optional UI
```

---

### 2. State Checks

**✅ Good — use boolean getters for simple guard conditions**

```dart
if (!state.isSuccess) {
  showSnackbar('Please wait until data is loaded');
  return;
}
```

**❌ Bad — manually checking the runtime type**

```dart
if (state is! SubSuccess) { // works, but brittle & verbose
  showSnackbar('Please wait until data is loaded');
  return;
}
```

---

**✅ Good — combine a boolean guard with safe pattern matching**

```dart
void onRetry() {
  if (state.isLoading) return; // fast-exit guard
  loadData();
}
```

**❌ Bad — checking state then force-unwrapping data**

```dart
void showResult() {
  if (state.isSuccess) {
    print(state.dataOrNull!); // ← ! hides the real guarantee; use pattern match instead
  }
}
```

---

### 3. Accessing Data

**✅ Good — destructure in pattern match for guaranteed non-null access**

```dart
if (state case SubSuccess(:final data)) {
  processData(data); // data is non-null here by construction
}
```

**✅ Good — `dataOrNull` with null-aware operators for optional reads**

```dart
final count = state.dataOrNull?.length ?? 0;
```

**❌ Bad — force-unwrapping `dataOrNull`**

```dart
final count = state.dataOrNull!.length; // crashes when not in success state
```

---

**✅ Good — use `errorOrNull` for optional error display**

```dart
Text(state.errorOrNull ?? 'Unknown error')
```

**❌ Bad — accessing error without checking state first**

```dart
throw Exception(state.errorOrNull!); // crashes if state is not SubFailure
```

---

### 4. Updating Success State

**✅ Good — `copyWith` to update individual fields without recreating everything**

```dart
// state is SubSuccess<UserProfile, AppError>
state = (state as SubSuccess<UserProfile, AppError>).copyWith(
  data: state.dataOrNull!.copyWith(name: 'Alice'),
);
```

**✅ Even better — use `map` to type-safely access `copyWith`**

```dart
state = state.map(
  initial: (v) => v,
  loading: (v) => v,
  failure: (v) => v,
  success: (v) => v.copyWith(
    data: v.data.copyWith(name: 'Alice'),
  ),
);
```

**❌ Bad — discarding state and creating a new success from scratch unnecessarily**

```dart
// Forces you to re-supply all data fields manually
state = SubState.success(
  UserProfile(
    id:    state.dataOrNull!.id,    // tedious
    email: state.dataOrNull!.email, // tedious
    name:  'Alice',
  ),
);
```

---

### 5. Using Multi-Value Variants

**✅ Good — `SubState2` when two logically related values arrive together**

```dart
SubState2<List<Product>, Cart, String> shopState = const SubState2.initial();

// On success
shopState = SubState2.success(products, cart);

// Consume
shopState.when(
  initial: ()               => const SplashScreen(),
  loading: ()               => const LoadingOverlay(),
  success: (products, cart) => ShopView(products: products, cart: cart),
  failure: (err)            => ErrorBanner(message: err),
);
```

**❌ Bad — two separate `SubState` objects for data that always loads together**

```dart
// Forces double-loading boilerplate and two failure surfaces
SubState<List<Product>, String> productsState = const SubState.initial();
SubState<Cart, String>          cartState     = const SubState.initial();
// Now you have to combine them manually everywhere — error-prone
```

---

**✅ Good — update one field of a multi-value success with `copyWith`**

```dart
if (shopState case final Sub2Success<List<Product>, Cart, String> s) {
  shopState = s.copyWith(data2: updatedCart);
}
```

**❌ Bad — reconstructing multi-value success manually**

```dart
shopState = SubState2.success(
  shopState.data1OrNull!,   // verbose, crash risk
  updatedCart,
);
```

---

## Full API Reference

### `when` / `maybeWhen` / `whenOrNull`

All three receive the unwrapped values directly (not the state object):

```dart
// when — all four cases required
R when<R>({
  required R Function()            initial,
  required R Function()            loading,
  required R Function(TSuccess)    success,
  required R Function(TError)      failure,
});

// maybeWhen — optional cases; orElse handles the rest
R maybeWhen<R>({
  R Function()?           initial,
  R Function()?           loading,
  R Function(TSuccess)?   success,
  R Function(TError)?     failure,
  required R Function()   orElse,
});

// whenOrNull — optional cases; returns null for unhandled states
R? whenOrNull<R>({
  R? Function()?          initial,
  R? Function()?          loading,
  R? Function(TSuccess)?  success,
  R? Function(TError)?    failure,
});
```

**Example — `whenOrNull` for conditional badge:**

```dart
final badgeText = state.whenOrNull<String>(
  loading: () => '…',
  success: (items) => '${items.length}',
);
// null when initial or failure → Widget renders nothing
```

---

### `map` / `maybeMap` / `mapOrNull`

Like `when`, but your callback receives the **full state object** — handy when you need `copyWith` or other instance-level members:

```dart
// map — all four cases required; receives typed state objects
R map<R>({
  required R Function(SubInitial<S, E>)  initial,
  required R Function(SubLoading<S, E>)  loading,
  required R Function(SubSuccess<S, E>)  success,
  required R Function(SubFailure<S, E>)  failure,
});

// maybeMap / mapOrNull — same optional signatures as maybeWhen / whenOrNull
```

**Example — in-place update via `map`:**

```dart
state = state.map(
  initial: (v) => v,
  loading: (v) => v,
  failure: (v) => v.copyWith(error: 'Retrying…'),
  success: (v) => v.copyWith(data: v.data + [newItem]),
);
```

---

### `copyWith`

Available on `SubSuccess` and `SubFailure` only. Omitting a parameter keeps the current value; passing `null` explicitly sets it to `null` (when the type is nullable).

```dart
// SubSuccess
final updated = successState.copyWith(data: newValue);

// SubFailure
final retrying = failureState.copyWith(error: 'Timeout, retrying…');
```

> Note: `copyWith` parameters are typed `Object?` so that "omit = keep current" works. Passing a value whose type doesn't match (including `null` for a non-nullable field) throws a `TypeError` at runtime rather than failing to compile.

---

### State Checks & Getters

```dart
state.isInitial   // true when SubInitial
state.isLoading   // true when SubLoading
state.isSuccess   // true when SubSuccess
state.isFailure   // true when SubFailure

state.dataOrNull  // TSuccess? — non-null only in success
state.errorOrNull // TError?   — non-null only in failure
```

For `SubState2`–`SubState5`, each data field has its own getter:

```dart
state.data1OrNull  // T1?
state.data2OrNull  // T2?
// …up to data5OrNull
```

---

## Flutter Integration

### With `setState`

```dart
class _HomeState extends State<HomeScreen> {
  SubState<List<Post>, String> _state = const SubState.initial();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _state = const SubState.loading());
    try {
      final posts = await PostRepository.fetchAll();
      setState(() => _state = SubState.success(posts));
    } catch (e) {
      setState(() => _state = SubState.failure(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _state.when(
      initial: ()      => const SizedBox.shrink(),
      loading: ()      => const Center(child: CircularProgressIndicator()),
      success: (posts) => PostList(posts: posts),
      failure: (msg)   => Center(
        child: Column(children: [
          Text(msg),
          ElevatedButton(onPressed: _load, child: const Text('Retry')),
        ]),
      ),
    );
  }
}
```

---

### With Bloc / Cubit

> Requires the separate [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) package.

```dart
// cubit
class PostCubit extends Cubit<SubState<List<Post>, String>> {
  PostCubit(this._repo) : super(const SubState.initial());

  final PostRepository _repo;

  Future<void> load() async {
    emit(const SubState.loading());
    try {
      emit(SubState.success(await _repo.fetchAll()));
    } catch (e) {
      emit(SubState.failure(e.toString()));
    }
  }
}

// widget
BlocBuilder<PostCubit, SubState<List<Post>, String>>(
  builder: (context, state) => state.when(
    initial: ()      => const SizedBox.shrink(),
    loading: ()      => const CircularProgressIndicator(),
    success: (posts) => PostList(posts: posts),
    failure: (msg)   => ErrorView(message: msg, onRetry: context.read<PostCubit>().load),
  ),
);
```

---

### With Riverpod

> Requires the separate [`riverpod`](https://pub.dev/packages/flutter_riverpod) package.

```dart
// notifier
@riverpod
class PostNotifier extends _$PostNotifier {
  @override
  SubState<List<Post>, String> build() => const SubState.initial();

  Future<void> load() async {
    state = const SubState.loading();
    try {
      state = SubState.success(await ref.read(postRepoProvider).fetchAll());
    } catch (e) {
      state = SubState.failure(e.toString());
    }
  }
}

// widget
Consumer(
  builder: (context, ref, _) {
    final state = ref.watch(postNotifierProvider);
    return state.when(
      initial: ()      => const SizedBox.shrink(),
      loading: ()      => const CircularProgressIndicator(),
      success: (posts) => PostList(posts: posts),
      failure: (msg)   => ErrorView(message: msg),
    );
  },
);
```

---

## Multi-Value Variants (SubState2–5)

Use these when a single operation naturally produces multiple related values:

```dart
// SubState2 example — search result + metadata
SubState2<List<Result>, SearchMeta, AppError> searchState =
    const SubState2.initial();

// Load
searchState = const SubState2.loading();
try {
  final (results, meta) = await searchService.query('flutter');
  searchState = SubState2.success(results, meta);
} on AppError catch (e) {
  searchState = SubState2.failure(e);
}

// Render
searchState.when(
  initial:  ()              => const SearchHint(),
  loading:  ()              => const SearchSpinner(),
  success:  (results, meta) => SearchResultsView(results: results, meta: meta),
  failure:  (err)           => AppErrorView(error: err),
);
```

```dart
// SubState3 example — dashboard: user + notifications + settings
SubState3<User, List<Notification>, Settings, DashboardError> dashState =
    const SubState3.initial();

final (user, notifs, settings) = await (
  userRepo.get(),
  notifRepo.getAll(),
  settingsRepo.load(),
).wait;

dashState = SubState3.success(user, notifs, settings);

dashState.when(
  initial: ()                       => const SplashScreen(),
  loading: ()                       => const DashboardSkeleton(),
  success: (user, notifs, settings) => DashboardScreen(
                                         user: user,
                                         notifications: notifs,
                                         settings: settings,
                                       ),
  failure: (err)                    => DashboardErrorView(error: err),
);
```

---

## Error Modelling Tips

Prefer a typed error class over raw `String` or `dynamic` to make failure branches meaningful:

```dart
// Define a sealed error hierarchy
sealed class AuthError {
  const AuthError();
}
class WrongCredentials extends AuthError { const WrongCredentials(); }
class AccountLocked    extends AuthError { const AccountLocked(); }
class NetworkFailure   extends AuthError {
  const NetworkFailure(this.message);
  final String message;
}

// Use it
SubState<UserSession, AuthError> loginState = const SubState.initial();

// In the failure branch, switch on the error type
loginState.whenOrNull(
  failure: (err) => switch (err) {
    WrongCredentials()             => showSnackbar('Wrong email or password'),
    AccountLocked()                => showSnackbar('Account is locked'),
    NetworkFailure(:final message) => showSnackbar('Network: $message'),
  },
);
```

**✅ Good — typed, sealed error: compiler catches unhandled error variants**

**❌ Bad — `String` error: no structure, no compile-time safety, string matching is fragile**

```dart
SubState<UserSession, String> loginState = const SubState.initial();

loginState.whenOrNull(
  failure: (err) {
    if (err.contains('credentials')) { /* brittle */ }
  },
);
```

---

## Summary Cheat-Sheet

```
Need all 4 cases?              → when / map
Need some cases + fallback?    → maybeWhen / maybeMap
Need some cases, null for rest → whenOrNull / mapOrNull

Need values only?              → when / maybeWhen / whenOrNull
Need the state object too?     → map / maybeMap / mapOrNull

Update a success field?        → successState.copyWith(data: newValue)
                                  via map(success: (v) => v.copyWith(…))

Multiple return values?        → SubState2 … SubState5
```

---

## Migrating from v1

v2 keeps the **same public API** — `when`, `maybeWhen`, `whenOrNull`, `map`, `maybeMap`, `mapOrNull`, `copyWith`, the `is*` getters and `dataOrNull` / `errorOrNull` all behave as before. What's new:

- The state variants are now **public** (`SubInitial`, `SubLoading`, `SubSuccess`, `SubFailure`, and the `Sub2…`–`Sub5…` families), so you can `switch` over them directly.
- `copyWith` is now available on failure states too, not just success.
- `SubState3.isFailure` now correctly reports the failure state.

---

Made with ❤️ for Flutter developers.
