import 'package:flutter/material.dart';

//Configuración del tema visual de la aplicación

class AppTheme {
  ThemeData getTheme() => // Tema basado en Material 3 con un color semilla personalizado
      ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF2862F5));
}
