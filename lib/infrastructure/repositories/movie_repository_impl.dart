import 'package:cinemapedia_220262/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220262/domain/entities/movie.dart';
import 'package:cinemapedia_220262/domain/repositories/movies_repository.dart';

// Implementación del repositorio de películas
class MovieRepositoryImpl extends MoviesRepository {

// Fuente de datos de películas
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

// Método para obtener películas en cartelera
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}