# 🧩 Sub State

A lightweight, type-safe state management utility for Dart and Flutter applications.  
 Choose the right number of parameters for your use case like SubState or SubState2 ...

---

## ✨ Features

- 🚀 **Type-safe** state management with generics  
- 🎯 **Four essential states**: Initial, Loading, Success, Failure  
- 🔍 **Easy state checking** with boolean getters  
- 💪 **Null-safe** data and error access  
- 🏗️ **Built with Freezed** for pattern matching and immutability  
- 📦 **Lightweight** and focused  

---

## ⚙️ Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  sub_state: ^1.0.0
```

---

## 🚀 Example – Bloc + UI

Below is a minimal working example using `SubState` with `Bloc` and `BlocBuilder`.

---

### 🧠 CounterBloc Example

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sub_state.dart';

// CounterBloc handles counter logic using SubState
class CounterBloc extends Cubit<SubState<int>> {
  CounterBloc() : super(const SubState.initial());

  // Increment the counter with a simulated delay
  Future<void> increment() async {
    emit(const SubState.loading()); // -> Loading state
    await Future.delayed(const Duration(seconds: 1));

    // Emit new success state with updated value
    final newValue = (state.dataOrNull ?? 0) + 1;
    emit(SubState.success(newValue));
  }

  // Emit failure example
  Future<void> fail() async {
    emit(const SubState.loading());
    await Future.delayed(const Duration(seconds: 1));
    emit(const SubState.failure("Something went wrong"));
  }

  // Reset to initial
  void reset() => emit(const SubState.initial());
}
```

---

### 🖼️ UI Example – Using `when`

```dart
BlocBuilder<CounterBloc, SubState<int>>(
  builder: (context, state) {
    // Pattern matching with Freezed's `when`
    return state.when(
      initial: () => const Text("Press + to start", style: TextStyle(fontSize: 20)),
      loading: () => const CircularProgressIndicator(),
      success: (data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter: $data", style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          const Text("(Loaded via 'when')"),
        ],
      ),
      failure: (error) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error: $error", style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 8),
          const Text("(Displayed via 'when')"),
        ],
      ),
    );
  },
)
```

---

### ✅ Alternative – Using `if / else` instead of `when`

```dart
BlocBuilder<CounterBloc, SubState<int>>(
  builder: (context, state) {
    if (state.isLoading) {
      return const CircularProgressIndicator();
    } else if (state.isSuccess) {
      return Text("Value: ${state.dataOrNull}");
    } else if (state.isFailure) {
      return Text("Error: ${state.errorOrNull}", style: const TextStyle(color: Colors.red));
    } else {
      return const Text("Initial state");
    }
  },
)
```

---

### 🧩 Optional – Using `maybeWhen`

```dart
state.maybeWhen(
  success: (data) => Text("Count: $data"),
  orElse: () => const Text("Waiting..."),
);
```

---

## 📘 Summary

| Layer | Description |
|--------|--------------|
| **Bloc** | Handles async logic and emits `SubState` updates |
| **SubState** | Defines four state variants: `initial`, `loading`, `success`, `failure` |
| **UI** | Reacts to `SubState` using `when`, `maybeWhen`, or `if/else` |
| **Freezed** | Enables pattern matching and immutability |

---

Made with ❤️ for Flutter developers.