import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiserveice.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepositry {
  BaseApiSercies _apiSercies = NetworkApiservies();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiSercies.getpostApiResponse(AppUrl.loginendpointUrl, data);
      return response;
    } catch (E) {
      throw E;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiSercies.getpostApiResponse(
          AppUrl.registerendpointUrl, data);
      return response;
    } catch (E) {
      throw E;
    }
  }
}
