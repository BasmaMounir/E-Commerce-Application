import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/AddToCartResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/AddToCartDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AddToCartRepository.dart';

class AddToCartRepositoryImpl implements AddToCartRepository {
  AddToCartDataSource addToCartDataSource;

  AddToCartRepositoryImpl({required this.addToCartDataSource});

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) {
    return addToCartDataSource.addToCart(productId);
  }
}
