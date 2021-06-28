import 'package:flutter_mvvm_architecture/core/services/quote_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quoteProvider = FutureProvider.autoDispose((_) {
  final quoteService = QuoteService.instance;
  return quoteService.getQuotes();
});
