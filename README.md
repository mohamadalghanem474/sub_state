# SubState & CubitSubState

A lightweight state management helper built on top of [`bloc`](https://pub.dev/packages/bloc) and [`freezed`](https://pub.dev/packages/freezed).  
It provides a simple way to represent **loading**, **success**, **failure**, and **initial** states in your Cubits.

---

## 🚀 Features

- `SubState` with four states: `initial`, `loading`, `success`, `failure`
- Convenience getters: `isInitial`, `isLoading`, `isSuccess`, `isFailure`
- Safe accessors: `dataOrNull`, `errorOrNull`
- `CubitSubState` base class with helper emit methods

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  bloc: ^8.1.0
  freezed_annotation: ^2.4.1
  # Your package (when published):
  sub_state: ^0.0.1
```

Then run:

```bash
flutter pub get
```

And don’t forget to run the code generator if you edit the `freezed` parts:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🛠 Usage

### Example Cubit

```dart
class UserCubit extends CubitSubState<String> {
  Future<void> fetchUser() async {
    emitLoading();
    await Future.delayed(const Duration(seconds: 1));
    emitSuccess("John Doe");
  }

  void failFetch() {
    emitFailure("Something went wrong");
  }
}
```

### Example Widget

```dart
BlocBuilder<UserCubit, SubState<String>>(
  builder: (context, state) {
    if (state.isLoading) {
      return const CircularProgressIndicator();
    } else if (state.isSuccess) {
      return Text("Hello, ${state.dataOrNull}");
    } else if (state.isFailure) {
      return Text("Error: ${state.errorOrNull}");
    }
    return const Text("Initial");
  },
);
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
