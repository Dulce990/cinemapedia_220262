import 'package:cinemapedia_220262/domain/entities/movie.dart';

abstract class MoviesDatasource { // Interfaz para la fuente de datos de películas
  Future<List<Movie>> getNowPlaying({int page = 1}); // Método para obtener películas en cartelera
}
