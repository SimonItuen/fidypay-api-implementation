abstract class IRemoteDataSource {
  Future<List<String>> getBillerList();
  Future<List<String>> getBillerAllDetailsByCategoryName({required String category});
  Future<double> getBalance();
}