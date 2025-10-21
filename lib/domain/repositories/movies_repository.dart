import 'package:cinemapedia_220262/domain/entities/movie.dart';

abstract class MoviesRepository { // Interfaz para el repositorio de películas
  Future<List<Movie>> getNowPlaying({int page = 1}); 
}
