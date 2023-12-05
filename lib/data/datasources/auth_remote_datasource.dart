import 'package:dartz/dartz.dart';
import 'package:flutter_cbt_tpa_frontend_elga/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/login_request_model.dart';
import '../models/request/register_request_model.dart';
import '../models/responses/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(RegisterRequestModel data) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data.toJson(),
    );
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('register gagal');
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return const Right('Logout Berhasil');
    } else {
      return const Left('Logout gagal');
    }
  }

  Future<Either<String, AuthResponseModel>> login(LoginRequestModel data) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data.toJson(),
    );
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('login gagal');
    }
  }
}
