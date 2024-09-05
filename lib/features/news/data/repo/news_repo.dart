import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foot_fire/core/errors/failure.dart';
import 'package:foot_fire/core/errors/server_failure.dart';
import 'package:foot_fire/core/networking/api_services.dart';
import 'package:foot_fire/features/news/data/repo/news_model.dart';

class NewsRepo {
  final ApiServices _apiServices;

  NewsRepo(this._apiServices);

  Future<Either<Failure, NewsModel>> getAllNews(String? keyWord) async {
    try {
      var response = await _apiServices.getNews(keyWord);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
