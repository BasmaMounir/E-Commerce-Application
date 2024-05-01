import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/AddToCartResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';

abstract class AddToCartRepository {
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}
