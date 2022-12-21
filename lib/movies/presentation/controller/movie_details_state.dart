part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;
  final List<RecommendationMovies> recommendationMovies;
  final RequestState recommendationMoviesRequestState;
  final String recommendationMoviesMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendationMovies = const [],
    this.recommendationMoviesRequestState = RequestState.loading,
    this.recommendationMoviesMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
    List<RecommendationMovies>? recommendationMovies,
    RequestState? recommendationMoviesRequestState,
    String? recommendationMoviesMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationMovies: recommendationMovies ?? this.recommendationMovies,
      recommendationMoviesRequestState: recommendationMoviesRequestState ??
          this.recommendationMoviesRequestState,
      recommendationMoviesMessage:
          recommendationMoviesMessage ?? this.recommendationMoviesMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsRequestState,
        movieDetailsMessage,
        recommendationMovies,
        recommendationMoviesRequestState,
        recommendationMoviesMessage,
      ];
}
