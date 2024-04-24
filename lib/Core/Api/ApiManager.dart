import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Core/Api/ApiEndPoints.dart';
import 'package:e_commerce_application/Data/Model/Auth/Request/Register/RegisterRequest.dart';
import 'package:e_commerce_application/Data/Model/Auth/Response/Register/RegisterResponseDm.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _apiManager;

  static ApiManager getInstance() {
    _apiManager ??= ApiManager._();
    return _apiManager!;
  }

  Future<Either<Failures, RegisterResponseDm>> register(String name,
      String email, String password, String rePassword, String phone) async {
    //https://ecommerce.routemisr.com/api/v1/auth/signup
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.registerEndPoint);
      var registerRequest = RegisterRequest(
        email: email,
        name: name,
        password: password,
        phone: phone,
        rePassword: rePassword,
      );
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDm.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(errorMessage: registerResponse.message!));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }
}
