import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xxxq_flutter/http/HttpCode.dart';
import 'package:xxxq_flutter/http/ResultData.dart';

/**
 * 请求响应拦截
 * 处理返回数据
 */
class ResponseInterceptors  extends InterceptorsWrapper{

  @override
  onResponse(Response response) {
    RequestOptions option = response.request;
    try {
      if (option.contentType != null &&
          option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, HttpCode.SUCCESS);
      }
      ///一般只需要处理200的情况，300、400、500保留错误信息
      if (response.statusCode == 200 || response.statusCode == 201) {
        int code = response.data["code"];

        if (code == 0) {

          return new ResultData(response.data, true, HttpCode.SUCCESS,
              headers: response.headers);


        } else if (code == 100006 || code == 100007) {

        } else {
          Fluttertoast.showToast(msg: response.data["msg"]);
          print("msg:"+response.data["msg"]);
          return new ResultData(response.data, false, HttpCode.SUCCESS,
              headers: response.headers);
        }
      }
    } catch (e) {
      print(e.toString() + option.path);

      return new ResultData(response.data, false, response.statusCode,
          headers: response.headers);
    }

    return new ResultData(response.data, false, response.statusCode,
        headers: response.headers);
  }
}