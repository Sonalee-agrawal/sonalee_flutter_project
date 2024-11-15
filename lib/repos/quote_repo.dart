import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonalee_app/data/quotes.dart';
import 'package:sonalee_app/utils/helpers/constants.dart';
import 'dart:convert';
import 'dart:developer';

import '../network/dio_client.dart';

class QuoteRepo {
  final Ref ref;
  QuoteRepo(this.ref);

  Future getAllQuotes() async {
    try {
      final response = await ref.read(dioProvider).get(QUOTES_API_URL);
      // log(response.data.toString());
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.data);

        final List<Quotes> quoteList =
            decodedJson.map<Quotes>((quote) => Quotes.fromJson(quote)).toList();

        log('quote 1st :: ');
        log( quoteList.first.quote!);
        return quoteList;
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

final quoteRepoProvider = Provider<QuoteRepo>((ref) => QuoteRepo(ref));
