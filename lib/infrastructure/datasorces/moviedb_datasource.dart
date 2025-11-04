import 'package:dio/dio.dart';
import 'package:cinemapedia_220262/config/constanst/enviroment.dart';
import 'package:cinemapedia_220262/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220262/domain/entities/movie.dart';
import 'package:cinemapedia_220262/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_220262/infrastructure/models/moviedb/moviedb_response.dart';

// Implementación de la fuente de datos de películas usando The Movie DB API

class MoviedbDataSource extends MoviesDatasource {
  // Configuración de Dio para realizar solicitudes HTTP a The Movie DB API
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  // Método para obtener películas en cartelera
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    // Filtrar y mapear los resultados a la entidad Movie

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no poster ')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  // Obtener peliculas populares

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    // Filtrar y mapear los resultados a la entidad Movie
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no poster ')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    // Filtrar y mapear los resultados a la entidad Movie

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no poster ')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getTopRaited({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    // Filtrar y mapear los resultados a la entidad Movie

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no poster ')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getMexicanMovies({int page = 1}) async {
    final response = await dio.get(
      '/discover/movie',
      queryParameters: {
        'page': page,
        'with_origin_country': 'MX',
        'with_original_languaje': 'es',
        'sort_by': 'vote_average.desc',
        'vote_count.gte':10

      },
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    // Filtrar y mapear los resultados a la entidad Movie

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no poster ')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
