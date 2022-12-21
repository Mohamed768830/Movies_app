import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<
    List<RecommendationMovies>, RecommendationMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationMovies>>> call(
      RecommendationMoviesParameters parameters) async {
    return await baseMoviesRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationMoviesParameters extends Equatable {
  final int id;

  const RecommendationMoviesParameters({required this.id});

  @override
  List<Object> get props => [id];
}
