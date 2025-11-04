import 'package:flutter/material.dart';

class FullscreenLoader extends StatelessWidget {
  const FullscreenLoader({super.key});
  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Bienvenid@ a Cinemapedia -220262',
      'Estableciendo elementos de comunicación',
      'Conectado a la API de TheMovieDB',
      'Obteniendo las peliculas que actualmente se proyectan',
      'Obteniendo los proximos estrenos',
      'Obteniendo las películas mejor valoradas',
      'Obteniendo las mejores peliculas Mexicanas',
      'Todo listo ... comencemos',
    ];

    return Stream.periodic(const Duration(milliseconds: 1500), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bienvenido a Cinemapedia -220262'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 4),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando....');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
