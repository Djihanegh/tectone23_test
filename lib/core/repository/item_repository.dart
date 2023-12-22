abstract class ItemRepository<T> {
  const ItemRepository();

  Stream<List<T>> getAllStream();

  Future<List<T>> getAll();
}
