import 'dart:async';
import 'dart:convert';

import 'package:cexl/model.dart';
import 'package:cexl/util.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
part 'my_providers.g.dart';

@Riverpod(keepAlive: true)
Dio client(ClientRef ref) {
  return Dio();
}

@riverpod
Future<List<CurrencyModel>> currentMMKExchange(
    CurrentMMKExchangeRef ref) async {
    
  final resp = await ref.read(clientProvider).get(
      "$currencyApiBase?base=$baseCurrency&currencies=$currencies",
      options: Options(headers: {"apikey": apikey}));
  final currencyData = CurrencyApiResponse.fromJson(resp.data);

  final p2pResp = await ref.read(clientProvider).post(biananceP2PBase,
      data: jsonEncode(biananceP2PPostData),
      options: Options(headers: {"Content-Type": "application/json"}));
  final d = BiananceP2PResponse.fromJson(p2pResp.data);

  List<CurrencyModel> currenciesData = [];
  double mmUSDPrice = double.tryParse(d.data?.first.adv?.price ?? "0.0") ?? 0.0;
  currenciesData.add(CurrencyModel(code: "USD", value: mmUSDPrice));
  currenciesData.add(CurrencyModel(
      code: "EUR",
      value:
          convertCurrency(mmUSDPrice, currencyData.data?.eur?.value ?? 0.0)));
  currenciesData.add(CurrencyModel(
      code: "SGD",
      value:
          convertCurrency(mmUSDPrice, currencyData.data?.sgd?.value ?? 0.0)));
  currenciesData.add(CurrencyModel(
      code: "CNY",
      value:
          convertCurrency(mmUSDPrice, currencyData.data?.cny?.value ?? 0.0)));
  currenciesData.add(CurrencyModel(
      code: "JPY",
      value:
          convertCurrency(mmUSDPrice, currencyData.data?.jpy?.value ?? 0.0)));
  currenciesData.add(CurrencyModel(
      code: "THB",
      value:
          convertCurrency(mmUSDPrice, currencyData.data?.thb?.value ?? 0.0)));
  currenciesData.add(CurrencyModel(
      code: "MYR",
      value:
          convertCurrency(mmUSDPrice, currencyData.data?.myr?.value ?? 0.0)));
  return currenciesData;
}

@riverpod
Stream<Map<String, BiananceMarketPriceResponse>> marketPriceStream(
    MarketPriceStreamRef ref) {
  final marketStream =
      StreamController<Map<String, BiananceMarketPriceResponse>>();
  final wb = WebSocketChannel.connect(Uri.parse(marketPriceSocket));
  wb.stream.listen((event) {
    final marketPrices = biananceMarketPriceResponseFromJson(event);
    Map<String, BiananceMarketPriceResponse> maps = {};
    for (var element in marketPrices) {
      maps[element.s ?? "_"] = element;
      marketPriceCache[element.s ?? "_"] = element;
    }
    //print(marketPrices);
    marketStream.add(maps);
  });
  return marketStream.stream;
}

@riverpod
Stream<Map<String, BiananceTradeRateResponse>> bTradeRate(BTradeRateRef ref) {
  final biananceStream =
      StreamController<Map<String, BiananceTradeRateResponse>>(
    onListen: () {},
  );
  final wb = WebSocketChannel.connect(Uri.parse(bianaceTradeRatesSocket));
  wb.stream.listen((event) {
    // biananceStream.sink.add(biananceTradeRateResponseFromJson(event));
    Future.delayed(
      const Duration(seconds: 1),
      () {
        final listRates = biananceTradeRateResponseFromJson(event);
        Map<String, BiananceTradeRateResponse> maps = {};
        for (var element in listRates) {
          maps[element.s ?? "_"] = element;
          cachedData[element.s ?? "_"] = element;
        }
        biananceStream.add(maps);
      },
    );
  });
  return biananceStream.stream;
}

@riverpod
List<String> cryptoName(CryptoNameRef ref, {String? filter}) {
  if (filter?.isNotEmpty == true && filter != null) {
    return cryptoNames
        .where(
            (element) => element.toLowerCase().contains(filter.toLowerCase()))
        .toList();
  }
  return cryptoNames;
}

const cryptoNames = [
  'AXSUSDT',
  'RSRUSDT',
  'AGIXUSDT',
  'GMXUSDT',
  'ATAUSDT',
  'OXTUSDT',
  'ICXUSDT',
  'SKLUSDT',
  'CHZUSDT',
  'NMRUSDT',
  'ENSUSDT',
  'DENTUSDT',
  'USDCUSDT',
  'ATOMUSDT',
  'HOOKUSDT',
  'OCEANUSDT',
  'ARPAUSDT',
  '1000FLOKIUSDT',
  'IDUSDT',
  'RAYUSDT',
  'ALICEUSDT',
  'TRXBUSD',
  'DODOXUSDT',
  'EDUUSDT',
  'IMXUSDT',
  'KEYUSDT',
  'XRPUSDT',
  'ADAUSDT',
  'CFXUSDT',
  'XVGUSDT',
  'KLAYUSDT',
  'AMBBUSD',
  'RLCUSDT',
  'SCUSDT',
  'LQTYUSDT',
  'PERPUSDT',
  'BNXUSDT',
  'SPELLUSDT',
  'ICPUSDT',
  'MAGICUSDT',
  'JASMYUSDT',
  'WOOUSDT',
  'STORJUSDT',
  'XLMUSDT',
  'BAKEUSDT',
  'AMBUSDT',
  'ANKRUSDT',
  'YFIUSDT',
  'MATICUSDT',
  'ALPHAUSDT',
  'COCOSUSDT',
  'ARKMUSDT',
  'BNBUSDT',
  'ARBUSDT',
  'CTSIUSDT',
  'DGBUSDT',
  'MTLUSDT',
  'LITUSDT',
  'AUDIOUSDT',
  'JOEUSDT',
  'ENJUSDT',
  'BANDUSDT',
  'UNFIUSDT',
  'BALUSDT',
  'SSVUSDT',
  'RADUSDT',
  'DUSKUSDT',
  'DOTUSDT',
  'DARUSDT',
  'PEOPLEUSDT',
  'THETAUSDT',
  'GRTUSDT',
  'AGLDUSDT',
  'IOTAUSDT',
  'ACHUSDT',
  'MINAUSDT',
  'LDOUSDT',
  'FTTUSDT',
  'CTKUSDT',
  'YGGUSDT',
  'ARUSDT',
  'WAVESUSDT',
  'GALUSDT',
  '1000SHIBUSDT',
  'RVNUSDT',
  'NEARUSDT',
  'DASHUSDT',
  'FILUSDT',
  'LUNA2USDT',
  'AAVEUSDT',
  'LTCUSDT',
  '1000PEPEUSDT',
  'STGUSDT',
  '1000LUNCUSDT',
  'SOLUSDT',
  'FXSUSDT',
  'CELOUSDT',
  'RENUSDT',
  'TLMUSDT',
  'COMBOUSDT',
  'GMTUSDT',
  'FETUSDT',
  'VETUSDT',
  'ZILUSDT',
  'ONTUSDT',
  'CHRUSDT',
  'MAVUSDT',
  'DEFIUSDT',
  'SNXUSDT',
  'BNTUSDT',
  'BTCUSDT',
  'DYDXUSDT',
  'OGNUSDT',
  'BTSUSDT',
  'LINKUSDT',
  'LINAUSDT',
  'APTUSDT',
  'EOSUSDT',
  'SXPUSDT',
  'TRUUSDT',
  'BLZUSDT',
  'PHBUSDT',
  'MKRUSDT',
  'SFPUSDT',
  'XTZUSDT',
  'MASKUSDT',
  'GALAUSDT',
  'IDEXUSDT',
  'ZENUSDT',
  'ZRXUSDT',
  'BELUSDT',
  'RUNEUSDT',
  'CKBUSDT',
  'REEFUSDT',
  'CRVUSDT',
  'SUSHIUSDT',
  'ANTUSDT',
  'ASTRUSDT',
  'LEVERUSDT',
  'BTCSTUSDT',
  'BTCDOMUSDT',
  'API3USDT',
  'HOTUSDT',
  '1INCHUSDT',
  'KNCUSDT',
  'ETHUSDT',
  'AVAXUSDT',
  'INJUSDT',
  'ETCUSDT',
  'KAVAUSDT',
  'XEMUSDT',
  'HBARUSDT',
  'BCHUSDT',
  'MANAUSDT',
  'C98USDT',
  'FLOWUSDT',
  'LRCUSDT',
  'HNTUSDT',
  'IOTXUSDT',
  'CELRUSDT',
  'OPUSDT',
  'CYBERUSDT',
  'GTCUSDT',
  'PENDLEUSDT',
  'DOGEUSDT',
  'NKNUSDT',
  'CVXUSDT',
  'SUIUSDT',
  '1000XECUSDT',
  'QNTUSDT',
  'BATUSDT',
  'RNDRUSDT',
  'WLDUSDT',
  'IOSTUSDT',
  'STXUSDT',
  'SEIUSDT',
  'TUSDT',
  'HFTUSDT',
  'BLURUSDT',
  'LPTUSDT',
  'HIGHUSDT',
  'RDNTUSDT',
  'XMRUSDT',
  'XVSUSDT',
  'APEUSDT',
  'KSMUSDT',
  'ZECUSDT',
  'UNIUSDT',
  'COMPUSDT',
  'ROSEUSDT',
  'SANDUSDT',
  'ONEUSDT',
  'MDTUSDT',
  'FOOTBALLUSDT',
  'COTIUSDT',
  'SRMUSDT',
  'UMAUSDT',
  'TRBUSDT',
  'STMXUSDT',
  'OMGUSDT',
  'NEOUSDT',
  'ALGOUSDT',
  'EGLDUSDT',
  'TRXUSDT',
  'BLUEBIRDUSDT',
  'CVCUSDT',
  'FLMUSDT',
  'FTMUSDT',
  'TOMOUSDT',
  'QTUMUSDT',
  'HIFIUSDT',
  'ARKUSDT',
  'FRONTUSDT',
];

Map<String, BiananceTradeRateResponse> cachedData = {};
Map<String, BiananceMarketPriceResponse> marketPriceCache = {};
