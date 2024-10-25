import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<Either<Failure, Map>> postRequest(String url, Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        body: data,
      );

      // Check if the response is JSON
      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains("application/json") == true) {
          try {
            Map responseBody = jsonDecode(response.body);
            return right(responseBody);
          } catch (e) {
            // If the response body is not JSON, return a custom failure
            return left(ServerFailure("Invalid JSON response: ${response.body}"));
          }
        } else {
          // If response is not JSON, return a custom error
          return left(ServerFailure("Unexpected response format: ${response.body}"));
        }
      } else {
        // Handle other status codes
        return left(ServerFailure("Error: ${response.statusCode} ${response.reasonPhrase}"));
      }
    } catch (e) {
      // Return any other errors as a ServerFailure
      return left(ServerFailure(e.toString()));
    }
  }
}
