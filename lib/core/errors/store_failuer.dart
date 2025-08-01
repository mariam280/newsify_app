// lib/core/error/failures.dart
abstract class StoreFailure {
  final String message;
  StoreFailure(this.message);
}

class FirestoreFailure extends StoreFailure {
  FirestoreFailure(super.message);
}
