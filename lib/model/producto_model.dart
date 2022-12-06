class Producto {
  final String nombre;
  final int stock;
  final String comprobante;
  final List<String> productos;

  Producto(
      {required this.nombre,
      required this.stock,
      required this.comprobante,
      required this.productos});

  Producto copyWith(
          {String? nombre,
          int? stock,
          String? comprobante,
          List<String>? productos}) =>
      Producto(
          nombre: nombre ?? this.nombre,
          stock: stock ?? this.stock,
          comprobante: comprobante ?? this.comprobante,
          productos: productos ?? this.productos);
}
