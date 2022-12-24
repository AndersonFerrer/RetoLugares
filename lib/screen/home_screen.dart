// ignore_for_file: prefer_const_constructors

import 'package:reto_lugares/modal/lugar_model.dart';
import 'package:reto_lugares/service/lugar_service.dart';
import 'package:reto_lugares/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lugarService = Provider.of<LugaresService>(context);

    if (lugarService.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Lugares',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: () => lugarService.refresh(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: ListView.builder(
            itemCount: lugarService.lugares.length,
            itemBuilder: (BuildContext context, int index) {
              final dato = lugarService.lugares[index];
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  CardCustom(
                    onTap: () {
                      lugarService.seleccionarLugar =
                          lugarService.lugares[index].copyWith();

                      Navigator.pushNamed(context, 'lugar_page');
                    },
                    title: dato.nombre,
                    subtitle: dato.descripcion,
                    leading: dato.img,
                  ),
                  Positioned(
                      right: -10,
                      top: -20,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        width: 30,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.close,
                          ),
                          color: Colors.black,
                          onPressed: () {
                            lugarService.borrarLugar(dato);
                            lugarService.lugares.removeAt(index);
                          },
                        ),
                      ))
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          lugarService.seleccionarLugar =
              Lugar(descripcion: '', nombre: '', img: '');
          Navigator.pushNamed(context, 'lugar_page');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
