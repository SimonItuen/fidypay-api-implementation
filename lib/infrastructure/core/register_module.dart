import 'package:dio/dio.dart';
import 'package:fidypay/presentation/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class RegisterModule {
  @LazySingleton()
  AppRouter get appRouter => AppRouter();

  @LazySingleton()
  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      GlobalKey<ScaffoldMessengerState>();

  @LazySingleton()
  Dio get dio => Dio();


  @LazySingleton()
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

}
