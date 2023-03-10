import 'package:reto_lugares/provider/lugar_provider.dart';
import 'package:reto_lugares/service/lugar_service.dart';
import 'package:reto_lugares/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LugarPage extends StatelessWidget {
  const LugarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lugarService = Provider.of<LugaresService>(context);
    return ChangeNotifierProvider(
      create: (_) => LugarFormProvider(lugarService.seleccionarLugar),
      child: LugarFormPage(lugarService: lugarService),
    );
  }
}

class LugarFormPage extends StatelessWidget {
  final LugaresService lugarService;

  const LugarFormPage({super.key, required this.lugarService});

  @override
  Widget build(BuildContext context) {
    final lugarForm = Provider.of<LugarFormProvider>(context);
    final dato = lugarForm.lugar;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: BackButton(color: Colors.white),
        title: const Text(
          'Lugares',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.black,
      body: Form(
        key: lugarForm.formkey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              CustomTextFormField(
                initialValue: dato.nombre,
                hintText: 'Nombre',
                onChanged: (value) => dato.nombre = value,
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextFormField(
                maxLines: null,
                initialValue: dato.descripcion,
                hintText: 'Descripcion',
                onChanged: (value) => dato.descripcion = value,
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextFormField(
                initialValue: dato.img,
                hintText: 'Imagen',
                onChanged: (value) => dato.img = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          lugarService.crearOactualizar(lugarForm.lugar);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
