import 'package:cinemapedia_220262/domain/entities/movie.dart';
import 'package:cinemapedia_220262/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

// StateNotifierProvider para gestionar el estado de las películas en cartelera
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
// Crear una instancia de MoviesNotifier con la función para obtener más películas
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

typedef MovieCallback = Future<List<Movie>> Function({int page});

// StateNotifier para gestionar la lista de películas
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

// Constructor de MoviesNotifier
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

// Método para cargar la siguiente página de películas
  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
