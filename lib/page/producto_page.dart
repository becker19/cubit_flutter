import 'package:cubit_flutter/cubit/producto/producto_cubit.dart';
import 'package:cubit_flutter/model/producto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoCubit = context.read<ProductoCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              productoCubit.borrarProducto();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: SizedBox(
        height: 200,
        child: Column(
          children: [
            FloatingActionButton(
              child: const Icon(Icons.star),
              onPressed: () {
                final newProducto = Producto(
                  nombre: 'Naruto',
                  stock: 26,
                  comprobante: 'Factura',
                  productos: ['IncaKola'],
                );
                productoCubit.seleccionarProducto(newProducto);
              },
            ),
            FloatingActionButton(
              child: const Icon(Icons.numbers),
              onPressed: () {
                productoCubit.cambiarStock(20);
              },
            ),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                productoCubit.agregarProducto();
              },
            )
          ],
        ),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductoCubit, ProductoState>(builder: (_, state) {
      switch (state.runtimeType) {
        case ProductoInitial:
          return const Center(
            child: Text('No hay datos'),
          );

        case ProductoActivo:
          return InfoProducto((state as ProductoActivo).producto);

        default:
          return const Center(
            child: Text('Estado no encontrado'),
          );
      }
    });
  }
}

class InfoProducto extends StatelessWidget {
  final Producto producto;

  const InfoProducto(this.producto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            child: Column(
              children: [
                const Text(
                  'Cliente',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: Text('Nombre: ${producto.nombre}'),
                ),
                ListTile(
                  title: Text('C. Pago: ${producto.comprobante}'),
                ),
                ListTile(
                  title: Text('Stock: ${producto.stock}'),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Column(
              children: [
                const Text(
                  'Productos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...producto.productos
                    .map(
                      (e) => ListTile(
                        title: Text(e),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
