import 'package:flutter/widgets.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movie_model.dart';
import 'package:mvvm/repositry/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myrepo = HomeRepositry();
  ApiReponse<Movie_model> movie = ApiReponse.loading();
  setmovielist(ApiReponse<Movie_model> reponse) {
    movie = reponse;
    notifyListeners();
  }

  Future<void> fetchmovielistapi() async {
    setmovielist(ApiReponse.loading());
    _myrepo.fetchMovieList().then((value) {
      setmovielist(ApiReponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setmovielist(ApiReponse.error(error.toString()));
    });
  }

  // Future<void> fetchapi() async {
  //   setmovielist(ApiReponse.loading());

  //   _myrepo.fetchmovie().then((value) {
  //     print(value);
  //     setmovielist(ApiReponse.completed(value));
  //   }).onError((error, stackTrace) {
  //     setmovielist(ApiReponse.error(error.toString()));

  //     print(error);
  //   });
  // }
}
