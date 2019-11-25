import 'package:dio/dio.dart';

/**
 * 日志拦截器
 */
class LogsInterceptors extends InterceptorsWrapper{
  @override
  onRequest(RequestOptions options) {
//    print("请求baseUrl：${options.baseUrl}");
    print("请求URL：${options.baseUrl}${options.path}");
    print('请求头: ' + options.headers.toString());
    if (options.data != null) {
      print('请求参数: ' + options.data.toString());
    }
    return options;
  }

  @override
  onResponse(Response response) {
    if (response != null) {
      var responseStr = response.toString();
      print("返回数据："+responseStr);
    }

    return response; // continue
  }

  @override
  onError(DioError err) {
    print('请求异常: ' + err.toString());
    print('请求异常信息: ' + err.response?.toString() ?? "");
    return err;
  }
}