//todo : view model => object use case
//todo : use case => object repository
//todo : repository => object data source
//todo : data source => object api

import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/AddToCartDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/AuthDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/GetAllCategoriesOrBrandsDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/GetAllProductsDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/AddToCartRepositoryImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/AuthRepositoryImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/GetAllCategoriesRepositoryImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/GetAllProductsRepositoryImpl.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/AddToCartDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/AuthDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/GetAllCategoriesOrBrandsDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/GetAllProductsDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AddToCartRepository.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AuthRepository.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllCategoriesOrBrandsRepository.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllProductsRepository.dart';
import 'package:e_commerce_application/Domain/UseCase/AddToCartUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllBrandsUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllCategoriesUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllProductsUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/LoginUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/RegisterUseCase.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

GetAllCategoriesUseCase injectAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(
      allCategoriesRepository: injectGetAllCategoriesRepository());
}

GetAllBrandsUseCase injectAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      allCategoriesRepository: injectGetAllCategoriesRepository());
}

GetAllProductsUseCase injectAllProductsUseCase() {
  return GetAllProductsUseCase(
      allProductsRepository: injectGetAllProductsRepository());
}

GetAllProductsRepository injectGetAllProductsRepository() {
  return GetAllProductsRepositoryImpl(
      allProductsDataSource: injectProductsDataSource());
}

GetAllProductsDataSource injectProductsDataSource() {
  return GetAllProductsDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetAllCategoriesOrBrandsRepository injectGetAllCategoriesRepository() {
  return GetAllCategoriesRepositoryImpl(
      allCategoriesOrBrandsDataSource: injectAllCategoriesDataSource());
}

GetAllCategoriesOrBrandsDataSource injectAllCategoriesDataSource() {
  return GetAllCategoriesOrBrandsDataSourceImpl(
      apiManager: ApiManager.getInstance());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authDataSource: injectAuthDataSource());
}

AuthDataSource injectAuthDataSource() {
  return AuthDataSourceImpl(apiManager: ApiManager.getInstance());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(addToCartRepository: injectAddToCartRepository());
}

AddToCartRepository injectAddToCartRepository() {
  return AddToCartRepositoryImpl(
      addToCartDataSource: injectAddToCartDataSource());
}

AddToCartDataSource injectAddToCartDataSource() {
  return AddToCartDataSourceImpl(apiManager: ApiManager.getInstance());
}
