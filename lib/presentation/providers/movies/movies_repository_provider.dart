import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220262/infrastructure/datasorces/moviedb_datasource.dart';
import 'package:cinemapedia_220262/infrastructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDataSource());
});
