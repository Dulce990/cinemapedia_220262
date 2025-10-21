import 'package:go_router/go_router.dart';
import 'package:cinemapedia_220262/presentation/screens/screens.dart';

// Configuración principal para las rutas usando go router

final appRouter = GoRouter( // Configuración de las rutas de la aplicación
  initialLocation: '/', // Ruta inicial de la aplicación
  routes: [ // Lista de rutas
    GoRoute(
      path: '/', // Ruta raíz
      name: HomeScreen.name, // Nombre de la ruta para referencia
      builder: (context, state) => const HomeScreen(),// Pantalla de inicio
    ),
  ],
);
