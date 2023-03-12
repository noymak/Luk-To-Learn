import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class Omise {
  final String? cardName, cardNumber, expMonth, expYear, security, price;
  Omise({
    required this.cardName,
    required this.cardNumber,
    required this.expMonth,
    required this.expYear,
    required this.security,
    required this.price,
  });

  var tokens;
  var status;

  Future<void> getToken() async {
    var url = Uri.https('vault.omise.co', '/tokens');
    var codec = latin1.fuse(base64);
    String publicKey = 'pkey_test_5t511eqprz2ieal157z'; //publicKey
    var specialKey = codec.encode(publicKey);
    print(specialKey);

    try {
      var response = await http.post(url, headers: {
        HttpHeaders.authorizationHeader: 'Basic $specialKey',
      }, body: {
        'card[name]': cardName,
        'card[number]': cardNumber,
        'card[expiration_month]': expMonth,
        'card[expiration_year]': expYear,
        'card[security_code]': security,
      });

      var responseBody = jsonDecode(response.body);
      print('token: ${responseBody['id']}');

      tokens = responseBody['id'];

      if (tokens == null) throw responseBody['message'];

      return tokens;
    } catch (e) {
      print(e);
    }
  }

  Future<void> cardCharge() async {
    var url = Uri.https('api.omise.co', '/charges');
    var codec = latin1.fuse(base64);
    String publicKey = 'skey_test_5t511esnc07u255xtem'; // secret key
    var specialKey = codec.encode(publicKey);

    try {
      var response = await http.post(url, headers: {
        HttpHeaders.authorizationHeader: 'Basic $specialKey',
      }, body: {
        'amount': price,
        'card': tokens,
        'currency': 'usd'
      });

      var responseBody = jsonDecode(response.body);
      print(responseBody['status']);

      status = responseBody['status'];
      if (status != 'successful') throw responseBody['message'];

      return status;
    } catch (e) {
      print(e);
    }
  }
}