import 'dart:developer';

import 'package:dio/dio.dart';

class HomeSerive {
  Future<String?> getApi() async {
    Dio dio = Dio();
    try {
      // final Response response =
      //     await dio.get('http://www.boredapi.com/api/activity');
      Response response =
          await Dio(BaseOptions()).get('http://www.boredapi.com/api/activity');
      log(response.statusCode.toString(), name: 'status code');
      log(response.data, name: 'response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["activity"];
        // return result;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
