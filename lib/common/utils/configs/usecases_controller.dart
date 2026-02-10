abstract class UsecasesController<T, Params> {
  Future<T> call({Params? params});
}
