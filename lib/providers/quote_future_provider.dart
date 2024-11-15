import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonalee_app/data/quotes.dart';
import '../repos/quote_repo.dart';



final quoteFutureProvider = FutureProvider<List<Quotes>>((ref) async {
  return await ref.watch(quoteRepoProvider).getAllQuotes();
});

