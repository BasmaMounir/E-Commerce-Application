import 'package:e_commerce_application/Domain/Entity/Products/ProductsResponseEntity.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {
  String loadingMessage;

  ProductsLoadingState({required this.loadingMessage});
}

class ProductsSuccessState extends ProductsStates {
  ProductsResponseEntity productsResponseEntity;

  ProductsSuccessState({required this.productsResponseEntity});
}

class ProductsErrorState extends ProductsStates {
  String errorMessage;

  ProductsErrorState({required this.errorMessage});
}
