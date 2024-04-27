import 'package:e_commerce_application/Domain/Entity/Products/ProductsEntity.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllProductsUseCase.dart';
import 'package:e_commerce_application/UI/AppBarItems/CategoriesAppBar/Cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewModel extends Cubit<ProductsStates> {
  ProductsViewModel({required this.productsUseCase})
      : super(ProductsInitialState());
  List<ProductsEntity> productsList = [];
  GetAllProductsUseCase productsUseCase;

  void getAllProducts() async {
    emit(ProductsLoadingState(loadingMessage: 'Loading...'));
    var either = await productsUseCase.invoke();
    either.fold((error) {
      emit(ProductsErrorState(errorMessage: error.errorMessage));
    }, (response) {
      productsList = response.data ?? [];
      emit(ProductsSuccessState(productsResponseEntity: response));
    });
  }
}
