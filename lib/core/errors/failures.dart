import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailer extends Failure {
  ServerFailer(super.errorMessage);

  factory ServerFailer.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailer('Connection timedout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailer('Send timedout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailer('Recevive timedout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailer('There is an issue with the server security certificate. Please try again later or contact support.');
      case DioExceptionType.badResponse:
        return ServerFailer.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailer('Request to ApiServse was canceld');
      case DioExceptionType.connectionError:
        return ServerFailer(
            'Unable to connect to the server. Please check your internet connection and try again.');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailer('No internet connection!');
        }
        return ServerFailer('Unexcepected error, Please try again!');
      default:
        return ServerFailer('Oops there was an error, Please try again!');
    }
  }

  factory ServerFailer.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailer(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailer('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailer('Internal server error, Please try later!');
    } else {
      return ServerFailer('Oops there was an error, Please try again!');
    }
  }
}