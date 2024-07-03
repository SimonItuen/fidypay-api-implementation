import 'package:dartz/dartz.dart';
import 'package:fidypay/domain/core/failures.dart';

abstract class IBbpsRepository{
  Future<Either<Failure, List<String>>> getBillerList();
}