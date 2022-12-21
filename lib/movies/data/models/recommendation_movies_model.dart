import 'package:movies_app/movies/domain/entities/recommendation_movies.dart';

class RecommendationMoviesModel extends RecommendationMovies {
  const RecommendationMoviesModel({required super.backdropPath, required super.id,});

factory RecommendationMoviesModel.fromJson(Map<String, dynamic> json) =>
    RecommendationMoviesModel(
     backdropPath: json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
     id: json['id'],
     );

}