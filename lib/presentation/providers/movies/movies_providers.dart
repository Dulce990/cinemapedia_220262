import 'package:cinemapedia_220262/domain/entities/movie.dart';
import 'package:cinemapedia_220262/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🔹 1. Definimos el tipo de función callback
typedef MovieCallback = Future<List<Movie>> Function({int page});

// 🔹 2. Provider principal
final nowPlayingMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier(),
);

// 🔹 2b. Otros providers (aún necesitan sus notifiers)
final popularMoviesProvider =
    NotifierProvider<PopularMoviesNotifier, List<Movie>>(
  () => PopularMoviesNotifier(),
);

final topRatedMoviesProvider =
    NotifierProvider<TopRatedMoviesNotifier, List<Movie>>(
  () => TopRatedMoviesNotifier(),
);

final upcomingMoviesProvider =
    NotifierProvider<UpcomingMoviesNotifier, List<Movie>>(
  () => UpcomingMoviesNotifier(),
);

final mexicanMoviesProvider =
    NotifierProvider<MexicanMoviesNotifier, List<Movie>>(
  () => MexicanMoviesNotifier(),
);

// 🔹 3. El Notifier que maneja el estado
class MoviesNotifier extends Notifier<List<Movie>> {
  late final MovieCallback fetchMoreMovies;
  bool isLoading = false;
  int currentPage = 0;

  @override
  List<Movie> build() {
    // Obtenemos el repositorio desde el ref
    final repository = ref.watch(movieRepositoryProvider);
    fetchMoreMovies = repository.getNowPlaying;
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    currentPage++;
    final movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];

    // opcional: pequeño delay para animaciones o pruebas
    await Future.delayed(const Duration(milliseconds: 300));

    isLoading = false;
  }
}

// 🔹 4. Notifiers para otros endpoints
class PopularMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
    return [];
  }
}

class TopRatedMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRaited;
    return [];
  }
}

class UpcomingMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
    return [];
  }
}

class MexicanMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    fetchMoreMovies = ref.watch(movieRepositoryProvider).getMexicanMovies;
    return [];
  }
}
