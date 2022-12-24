import 'dart:convert';

class Lugar {
  String descripcion;
  String nombre;
  String? id;
  String img;

  Lugar({
    required this.descripcion,
    required this.nombre,
    required this.img,
    this.id,
  });

  factory Lugar.fromJson(String str) => Lugar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lugar.fromMap(Map<String, dynamic> json) => Lugar(
      descripcion: json["descripcion"],
      nombre: json["nombre"],
      img: json["img"]);

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "nombre": nombre,
        "img": img,
      };

  Lugar copyWith() => Lugar(
        descripcion: descripcion,
        nombre: nombre,
        img: img,
        id: id,
      );
}
