import 'package:dartz/dartz.dart';
import 'package:fidypay/domain/banking/i_banking_repository.dart';
import 'package:fidypay/domain/bbps/i_bbps_repository.dart';
import 'package:fidypay/domain/core/failures.dart';
import 'package:fidypay/infrastructure/core/data_source/remote/i_remote_data_source.dart';
import 'package:fidypay/infrastructure/core/exceptions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBbpsRepository)
class BbpsRepository implements IBbpsRepository {
  final IRemoteDataSource _remoteDataSource;

  const BbpsRepository(this._remoteDataSource);

  @override
  Future<Either<Failure, List<String>>> getBillerList() async {
    try {
      List<String> billerList = await _remoteDataSource.getBillerList();
      return Right(billerList);
    } on ClientException catch (e) {
      return Left(ClientFailure(message: e.message));
    } on NoInternetConnectionException {
      return Left(NoInternetConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on TimeoutException {
      return Left(TimeoutFailure());
    } catch (e) {
      return Left(SomethingWentFailure(message: e.toString()));
    }
  }
}
