import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220262/config/theme/app_theme.dart';
import 'package:cinemapedia_220262/config/router/app_router.dart';

// Punto de entrada de la aplicación
Future<void> main() async {
  await dotenv.load(fileName: '.env');
// Cargar las variables de entorno desde el archivo .env
  runApp(const ProviderScope(child: MainApp()));
}

// Widget principal de la aplicación
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
