import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<Movie_model> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = Movie_model.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
