import 'package:dartz/dartz.dart';
import 'package:fidypay/domain/banking/i_banking_repository.dart';
import 'package:fidypay/domain/core/failures.dart';
import 'package:fidypay/infrastructure/core/data_source/remote/i_remote_data_source.dart';
import 'package:fidypay/infrastructure/core/exceptions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBankingRepository)
class BankingRepository implements IBankingRepository {
  final IRemoteDataSource _remoteDataSource;

  const BankingRepository(this._remoteDataSource);


}
