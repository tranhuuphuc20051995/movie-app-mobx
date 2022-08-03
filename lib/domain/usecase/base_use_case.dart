abstract class BaseUseCase<T, P> {
  Future<T> call({required P params});
}
