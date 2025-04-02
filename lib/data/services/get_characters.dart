import 'package:dio/dio.dart';
import 'package:film_actors_app/data/models/character_model.dart';
import 'package:film_actors_app/presentation/resources/constants_manager.dart';

class GetCharactersService {
  late Dio _dio;
  GetCharactersService() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.baseUrl, // Example API
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      // headers: {
      //   "Content-Type": "application/json",
      //   "Accept": "application/json",
      // },
    );
    _dio = Dio(options);
  }

  Future<dynamic> getCharactersData() async {
    try {
      Response response = await _dio.get('character');

      if (response.statusCode == 200) {
        return response.data['results']; // Successful response
        /// let's return a list of characters in our repository  . go to it
      } else {
        throw Exception("Failed with status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// Error Handling Function
  String _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection timeout, please check your internet.";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Server took too long to respond.";
    } else if (e.type == DioExceptionType.badResponse) {
      return "Error ${e.response?.statusCode}: ${e.response?.statusMessage}";
    } else if (e.type == DioExceptionType.unknown) {
      return "Unexpected error occurred. Please try again.";
    } else {
      return "Something went wrong.";
    }
  }
}
