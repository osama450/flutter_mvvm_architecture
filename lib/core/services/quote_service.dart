import 'package:dio/dio.dart';
import 'package:flutter_mvvm_architecture/core/constants/api_constants.dart';
import 'package:flutter_mvvm_architecture/core/models/category_model.dart';

class QuoteService {
  QuoteService._();
  static final instance = QuoteService._();

  final url = ApiConstants.BASE_URL + ApiConstants.CATEGORY;

  Future<Category> getQuotes() async {
    final response = await Dio().get(
      url,
    );
    print(response.data);
    return Category.fromJson(response.data);
  }
}
