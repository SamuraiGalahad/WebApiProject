import 'package:flutter/material.dart';

class Pet {
  final Image image;

  final String type;

  final String name;

  Pet({
    required this.image,
    required this.type,
    required this.name,
  });

  Pet.loading() : this(image: Image.asset("images/loading.png"),type:'...', name: '...');

  bool get isLoading => name == '...';
}
