import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiserveice.dart';
import 'package:mvvm/model/movie_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepositry {
  BaseApiSercies _apiSercies = NetworkApiservies();

  Future<Movie_model> fetchMovieList() async {
    try {
      dynamic response =
          await _apiSercies.getGetApiResponse(AppUrl.movieendpointUrl);
      print(response);
      return response = Movie_model.fromJson(response);
    } catch (E) {
      throw E;
    }
  }
}
