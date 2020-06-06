import 'dart:ffi';

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

  Future getCoinData(String currency) async{
    List<double> exchangeRateList;
    http.Response response0 =  await http.get('$coinURL/${cryptoList[0]}/$currency?apikey=$apiKey');
    http.Response response1 =  await http.get('$coinURL/${cryptoList[1]}/$currency?apikey=$apiKey');
    http.Response response2 =  await http.get('$coinURL/${cryptoList[2]}/$currency?apikey=$apiKey');
    if( response0.statusCode == 200 && response1.statusCode == 200 && response2.statusCode == 200 ){
      double exchangeRate0 = jsonDecode(response0.body)['rate'];
      double exchangeRate1 = jsonDecode(response1.body)['rate'];
      double exchangeRate2 = jsonDecode(response2.body)['rate'];
      exchangeRateList.add(exchangeRate0);
      exchangeRateList.add(exchangeRate1);
      exchangeRateList.add(exchangeRate2);
      return exchangeRateList;
    } else {
      print(response0.statusCode);
      print(response1.statusCode);
      print(response2.statusCode);
      throw 'Problem with the get request';
    }
  }
}
