import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:mvvm/data/app_excaptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';

class NetworkApiservies extends BaseApiSercies {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responsejson;
    try {
      final response =
          await https.post(Uri.parse(url)).timeout(Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('NO interent connection');
    }
    return responsejson;
  }

  @override
  Future getpostApiResponse(String url, dynamic data) async {
    dynamic responsejson;
    try {
      Response response = await https
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('NO interent connection');
    }
    return responsejson;
  }

  dynamic returnResponse(https.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Erro accord communication serve' + response.statusCode.toString());
    }
  }
}
