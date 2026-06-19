## 0.0.01

* initial release.

## 1.1.0

* add progress in loading

## 1.2.0

* add TError

## 2.0.0

* Rewritten on native Dart 3 `sealed` classes — `sub_state` is now a pure-Dart
  package you just add and import.
* State variants are now **public** (`SubInitial`, `SubLoading`, `SubSuccess`,
  `SubFailure`, and the `Sub2…`–`Sub5…` families), enabling native, exhaustive
  `switch` pattern matching.
* Added `copyWith` on the failure variants (previously only on success).
* **Fix:** `SubState3.isFailure` now correctly reports failures (it previously
  checked the wrong variant type and always returned `false`).
* Same public API as v1 (`when`, `maybeWhen`, `whenOrNull`, `map`, `maybeMap`,
  `mapOrNull`, the `is*` getters, `dataOrNull` / `errorOrNull`).
* Added a full test suite.
