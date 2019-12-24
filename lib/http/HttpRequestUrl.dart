class HttpRequestUrl{

  //外协
  static const String BASE_URL_OUTER = "http://116.117.157.183:28101/";
  //本地
  static const String BASE_URL_SELF = "";



  //登录
  static const String URL_Login="v1/login";

  //查询压缩站
  static const String URL_ALL_COMPRESS="v1/getRoleYsz";

  //查询车牌
  static const String URL_CAR_NUM="v1/getRoleCar";

  //查询焚烧厂
  static const String URL_BURN_STATION="v1/getAllFsc";

  //查询司机
  static const String URL_DRIVER="v1/findRoleUser";

  //查询全部联系人
  static const String URL_FIND_ALL_USER="v1/findAllUser";


  //派单
  static const String URL_SEND_ORDER="tyd/toTyd";

  //站长获取运单列表
  static const String URL_ORDER_LIST="tyd/searchTyd";

  //站长取消运单
  static const String URL_CANCEL_ORDER="tyd/cancelTyd";

  //站长确认运单
  static const String URL_AFFIRM_ORDER="tyd/finishTyd";

  //司机接单
  static const String URL_ACCEPT_ORDER="tyd/driverTyd";

  //司机起运
  static const String URL_START_ORDER="tyd/startTyd";

  //司机确认到达
  static const String URL_END_ORDER="tyd/saveBDTyd";

  //文件上传
  static const String URL_FILE_UPLOAD="v1/upload";



  //文件上传
  static const String URL_CHECK_SET="api/attendance/param/listBySiteId";

}