import 'dart:convert';
import 'package:godess/models/shows.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:3000';

  final String registrationEndpoint = '/registration';
  final String signInEndpoint = '/signin';
  final String channelsEndpoint = '/api/shows';
  final String calendarEndpoint = '/api/calendar';

  Future<void> registerUser(String email, String password, String fullName,
      String verificationCode) async {
    final url = Uri.parse(baseUrl + registrationEndpoint);
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "fullName": fullName,
          "verificationCode": verificationCode,
        }),
      );

      if (response.statusCode == 200) {
        print('User registered successfully');
      } else {
        print(
            'Failed to register user. Status code: ${response.statusCode}, Response: ${response.body}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  Future<void> signInUser(String email, String password) async {
    final url = Uri.parse(baseUrl + signInEndpoint);
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Sign-in successful: ${responseData}');
      } else {
        print('Failed to sign in: ${response.body}');
      }
    } catch (e) {
      print('Error during sign in: $e');
    }
  }

  Future<List<Show>> fetchChannels() async {
    final url = Uri.parse(baseUrl + channelsEndpoint);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);

        return jsonResponse.map((channel) => Show.fromJson(channel)).toList();
      } else {
        print(
            'Failed to load channels. Status code: ${response.statusCode}, Response: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error during fetching channels: $e');
      return [];
    }
  }

  Future<List<Map<String, String>>> fetchCalendar(int year, int month) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/api/calendar?year=$year&month=$month'), // Pass year and month as query parameters
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);

        return jsonResponse.map<Map<String, String>>((item) {
          return {
            'image': item['image'],
            'name': item['name'],
            'date': item['date'],
            'alt': item['alt'],
          };
        }).toList();
      } else {
        print(
            'Failed to load calendar. Status code: ${response.statusCode}, Response: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error during fetching calendar: $e');
      return [];
    }
  }
}
