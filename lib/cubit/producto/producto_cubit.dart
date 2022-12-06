import 'package:bloc/bloc.dart';
import 'package:cubit_flutter/model/producto_model.dart';
import 'package:meta/meta.dart';

part 'producto_state.dart';

class ProductoCubit extends Cubit<ProductoState> {
  ProductoCubit() : super(ProductoInitial());

  void seleccionarProducto(Producto producto) {
    emit(ProductoActivo(producto));
  }

  void cambiarStock(int stock) {
    final currentState = state;

    if (currentState is ProductoActivo) {
      // final newProducto = currentState.producto.copyWith(stock: 50);
      final newProducto = currentState.producto.copyWith(stock: stock);
      emit(ProductoActivo(newProducto));
    }
  }

  void agregarProducto() {
    final currentState = state;
    if (currentState is ProductoActivo) {
      final newProducto = [
        ...currentState.producto.productos,
        'Producto ${currentState.producto.productos.length + 1}'
      ];

      final newProductos =
          currentState.producto.copyWith(productos: newProducto);
      emit(ProductoActivo(newProductos));
    }
  }

  void borrarProducto() {
    emit(ProductoInitial());
  }
}
