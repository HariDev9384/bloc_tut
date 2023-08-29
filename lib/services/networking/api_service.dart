import '../../utils/utils.dart';

class NetworkService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson ;
    try {
      final response = await DioClient.dio.get(url);
      responseJson = returnResponse(response);
    }on SocketException {
      throw InternetException('no network');
    }
    return responseJson;

  }


  @override
  Future getPostApiResponse(String url , dynamic data) async{
    dynamic responseJson ;
    try {
      Response response = await DioClient.dio.post(url,data: data);
      responseJson = returnResponse(response);
    }on SocketException {
      throw InternetException('no network');
    }

    return responseJson ;
  }

  dynamic returnResponse (Response response){

    switch(response.statusCode){
      case 200:
        return response.data;
      case 201: // created
       return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.data.toString());
      default:
        throw ServerTimeOut('Error accured while communicating with server with status code ${response.statusCode}');

    }
  }

}