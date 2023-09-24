const biananceP2PBase =
    "https://p2p.binance.com/bapi/c2c/v2/friendly/c2c/adv/search";
const currencyApiBase = "https://api.currencyapi.com/v3/latest";
const apikey = "";
const baseCurrency = "USD";
const currencies = "EUR,CNY,THB,MYR,JPY,SGD";
const biananceP2PPostData = {
  "fiat": "MMK",
  "page": 1,
  "rows": 10,
  "tradeType": "BUY",
  "asset": "USDT",
  "countries": [],
  "proMerchantAds": false,
  "shieldMerchantAds": false,
  "publisherType": null,
  "payTypes": [],
  "classifies": ["mass", "profession"]
};
const cryptoIconsBaseURL = "https://coinicons-api.vercel.app/api/icon";
const bianaceTradeRatesSocket = "wss://fstream.binance.com/ws/!ticker@arr";
const marketPriceSocket = "wss://fstream.binance.com/ws/!markPrice@arr";

double convertCurrency(double base, double price) {
  return base / price;
}
