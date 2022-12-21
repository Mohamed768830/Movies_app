import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_movies_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getRecommendationMoviesUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            movieDetailsRequestState: RequestState.error,
            movieDetailsMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            movieDetailsRequestState: RequestState.loaded,
            movieDetail: r,
          ),
        );
      },
    );
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMoviesUseCase(
        RecommendationMoviesParameters(id: event.id));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            recommendationMoviesRequestState: RequestState.error,
            recommendationMoviesMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            recommendationMoviesRequestState: RequestState.loaded,
            recommendationMovies: r,
          ),
        );
      },
    );
  }
}
