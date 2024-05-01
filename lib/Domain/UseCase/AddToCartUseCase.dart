import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/AddToCartResponseEntity.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AddToCartRepository.dart';

import '../Entity/Failures.dart';

class AddToCartUseCase {
  AddToCartRepository addToCartRepository;

  AddToCartUseCase({required this.addToCartRepository});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return addToCartRepository.addToCart(productId);
  }
}
