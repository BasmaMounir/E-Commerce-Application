import 'package:dartz/dartz.dart';

import '../../Entity/Failures.dart';
import '../../Entity/RegisterResponseEntity.dart';

abstract class AuthDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);
}
