class AppUrl {
  // static const String liveBaseURL = "http://10.54.135.142:8081/api/";
  static const String liveBaseURL = "http://106.51.1.175:9007/api/";

  static const String baseURL = liveBaseURL;
  static const String login = baseURL + "login";
  static const String logout = baseURL + "login";
  static const String workorder = baseURL + "workorder-getall";
  static const String productionworkorder =
      baseURL + "productionworkorder-getall";
  static const String qualityprod = baseURL + "qualityprod";
}
