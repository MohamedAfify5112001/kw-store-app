abstract interface class BaseCopyableWith<T> {
  T copyWith();
}

abstract interface class Copyable<T> implements BaseCopyableWith<T> {
  T copy();
}
