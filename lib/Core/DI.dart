//todo : view model => object use case
//todo : use case => object repository
//todo : repository => object data source
//todo : data source => object api

import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/AuthDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/AuthRepositoryImpl.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/AuthDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AuthRepository.dart';
import 'package:e_commerce_application/Domain/UseCase/LoginUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/RegisterUseCase.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authDataSource: injectAuthDataSource());
}

AuthDataSource injectAuthDataSource() {
  return AuthDataSourceImpl(apiManager: ApiManager.getInstance());
}
