part of 'producto_cubit.dart';

@immutable
abstract class ProductoState {}

class ProductoInitial extends ProductoState {
  final existeProducto = false;
}

class ProductoActivo extends ProductoState {
  final existeProducto = true;
  final Producto producto;

  ProductoActivo(this.producto);
}
