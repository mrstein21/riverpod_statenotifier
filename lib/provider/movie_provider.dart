import 'package:dio/dio.dart';
import 'package:riverpod_statenotifier/utils/constant.dart';
import '../model/detail_movie.dart';
import '../model/res/movie_res.dart';
import '../utils/logging.dart';
import '../utils/network/error_handling.dart';
import '../utils/network/interceptor.dart';

class MovieProvider{
  late Dio _dio;

  MovieProvider(){
    BaseOptions options  =
    BaseOptions(
        baseUrl: kApiUrl,
        receiveTimeout: 15000,
        connectTimeout: kConnectionTimeout
    );
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }


  Future<DetailMovie> geDetailMovie(String id) async {
    try {
      final response = await _dio.get(
        '/movie/$id',
        queryParameters: {
          'api_key':kApiKey
        },
      );
      return DetailMovie.fromJson(response.data);
    } catch (e, s) {
      logger.e('getDetailMovie', e, s);
      return Future.error(ErrorHandling(e));
    }
  }

  Future<MovieRes> getTopRatedMovie(int page) async {
    try {
      final response = await _dio.get(
      '/movie/top_rated',
      queryParameters: {
        'page':'$page',
        'api_key':kApiKey
      },
    );
      return MovieRes.fromJson(response.data);
    } catch (e, s) {
      logger.e('getMoviePopular', e, s);
      return Future.error(ErrorHandling(e));
    }
  }

  Future<MovieRes> getRecommendation(int id) async {
    try {
      final response = await _dio.get(
      '/movie/$id/recommendations',
      queryParameters: {
        'api_key':kApiKey
      },
    );
      return MovieRes.fromJson(response.data);
    } catch (e, s) {
      logger.e('getMovieRecommended', e, s);
      return Future.error(ErrorHandling(e));
    }
  }

}