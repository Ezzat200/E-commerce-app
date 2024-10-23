import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Time Out With ApiService');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Time Out With ApiService');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Time Out With ApiService');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate With ApiService');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld ');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet connection ');

      case DioExceptionType.unknown:
        return ServerFailure('UnExpected error ');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found ,please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error ,please try later!');
    } else {
      return ServerFailure('Something went wrong ,please try again');
    }
  }
}
