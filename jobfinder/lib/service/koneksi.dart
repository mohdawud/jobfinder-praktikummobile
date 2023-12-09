// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:jobfinder/service/view_modal.dart';
import 'package:dio/dio.dart';

class ApiService {
  // var client = http.Client();

  // Future<List<Jobs>?> getJobs() async {
  //   var uri =
  //       Uri.parse('http://192.168.123.54:3000/jobs'); // Sesuaikan URL API Anda
  //   var response = await client.get(uri, );

  //   if (response.statusCode == 200) {
  //     return jobsFromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }

  final dio = Dio();

  Future<List<Jobs>?> getJobs() async {
    final response = await dio.get(
      'http://10.90.35.89:3000/jobs',
    );
    print(response);
    if (response.statusCode == 200) {
      return jobsFromJson(response.data);
    } else {
      return null;
    }
  }
}
