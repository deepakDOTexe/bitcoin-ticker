import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '9746D9B2-F4FF-4211-B3B8-CC3B2F3CC0F8';

const coinURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {

  Future getCoinData() async{
    String url = '$coinURL/BTC/USD?apikey=$apiKey';
    http.Response response =  await http.get(url);
    if(response.statusCode == 200){
      double exchangeRate = jsonDecode(response.body)['rate'];
      return exchangeRate;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
