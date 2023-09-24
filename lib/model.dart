// Currency api
// To parse this JSON data, do
//
//     final currencyApiResponse = currencyApiResponseFromJson(jsonString);

import 'dart:convert';

CurrencyApiResponse currencyApiResponseFromJson(String str) =>
    CurrencyApiResponse.fromJson(json.decode(str));

String currencyApiResponseToJson(CurrencyApiResponse data) =>
    json.encode(data.toJson());

class CurrencyApiResponse {
  final Meta? meta;
  final Data? data;

  CurrencyApiResponse({
    this.meta,
    this.data,
  });

  CurrencyApiResponse copyWith({
    Meta? meta,
    Data? data,
  }) =>
      CurrencyApiResponse(
        meta: meta ?? this.meta,
        data: data ?? this.data,
      );

  factory CurrencyApiResponse.fromJson(Map<String, dynamic> json) =>
      CurrencyApiResponse(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  final CurrencyModel? cny;
  final CurrencyModel? eur;
  final CurrencyModel? jpy;
  final CurrencyModel? myr;
  final CurrencyModel? thb;
  final CurrencyModel? sgd;

  Data({
    this.cny,
    this.eur,
    this.jpy,
    this.myr,
    this.thb,
    this.sgd,
  });

  Data copyWith({
    CurrencyModel? cny,
    CurrencyModel? eur,
    CurrencyModel? jpy,
    CurrencyModel? myr,
    CurrencyModel? thb,
    CurrencyModel? sgd,
  }) =>
      Data(
        cny: cny ?? this.cny,
        eur: eur ?? this.eur,
        jpy: jpy ?? this.jpy,
        myr: myr ?? this.myr,
        thb: thb ?? this.thb,
        sgd: sgd ?? this.sgd
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cny: json["CNY"] == null ? null : CurrencyModel.fromJson(json["CNY"]),
        eur: json["EUR"] == null ? null : CurrencyModel.fromJson(json["EUR"]),
        jpy: json["JPY"] == null ? null : CurrencyModel.fromJson(json["JPY"]),
        myr: json["MYR"] == null ? null : CurrencyModel.fromJson(json["MYR"]),
        thb: json["THB"] == null ? null : CurrencyModel.fromJson(json["THB"]),
        sgd: json["SGD"] == null ? null : CurrencyModel.fromJson(json["SGD"]),
      );

  Map<String, dynamic> toJson() => {
        "CNY": cny?.toJson(),
        "EUR": eur?.toJson(),
        "JPY": jpy?.toJson(),
        "MYR": myr?.toJson(),
        "THB": thb?.toJson(),
      };
}

class CurrencyModel {
  final String? code;
  final double? value;

  CurrencyModel({
    this.code,
    this.value,
  });

  CurrencyModel copyWith({
    String? code,
    double? value,
  }) =>
      CurrencyModel(
        code: code ?? this.code,
        value: value ?? this.value,
      );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        code: json["code"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "value": value,
      };
}

class Meta {
  final String? lastUpdatedAt;

  Meta({
    this.lastUpdatedAt,
  });

  Meta copyWith({
    String? lastUpdatedAt,
  }) =>
      Meta(
        lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        lastUpdatedAt: json["last_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "last_updated_at": lastUpdatedAt,
      };
}

/// end
///
///

///
///
///
///

BiananceP2PResponse biananceP2PResponseFromJson(String str) =>
    BiananceP2PResponse.fromJson(json.decode(str));

String biananceP2PResponseToJson(BiananceP2PResponse data) =>
    json.encode(data.toJson());

class BiananceP2PResponse {
  final String? code;
  final dynamic message;
  final dynamic messageDetail;
  final List<P2PData>? data;
  final int? total;
  final bool? success;

  BiananceP2PResponse({
    this.code,
    this.message,
    this.messageDetail,
    this.data,
    this.total,
    this.success,
  });

  BiananceP2PResponse copyWith({
    String? code,
    dynamic message,
    dynamic messageDetail,
    List<P2PData>? data,
    int? total,
    bool? success,
  }) =>
      BiananceP2PResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        messageDetail: messageDetail ?? this.messageDetail,
        data: data ?? this.data,
        total: total ?? this.total,
        success: success ?? this.success,
      );

  factory BiananceP2PResponse.fromJson(Map<String, dynamic> json) =>
      BiananceP2PResponse(
        code: json["code"],
        message: json["message"],
        messageDetail: json["messageDetail"],
        data: json["data"] == null
            ? []
            : List<P2PData>.from(json["data"]!.map((x) => P2PData.fromJson(x))),
        total: json["total"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "messageDetail": messageDetail,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
        "success": success,
      };
}

class P2PData {
  final Adv? adv;
  final Advertiser? advertiser;

  P2PData({
    this.adv,
    this.advertiser,
  });

  P2PData copyWith({
    Adv? adv,
    Advertiser? advertiser,
  }) =>
      P2PData(
        adv: adv ?? this.adv,
        advertiser: advertiser ?? this.advertiser,
      );

  factory P2PData.fromJson(Map<String, dynamic> json) => P2PData(
        adv: json["adv"] == null ? null : Adv.fromJson(json["adv"]),
        advertiser: json["advertiser"] == null
            ? null
            : Advertiser.fromJson(json["advertiser"]),
      );

  Map<String, dynamic> toJson() => {
        "adv": adv?.toJson(),
        "advertiser": advertiser?.toJson(),
      };
}

class Adv {
  final String? advNo;
  final String? classify;
  final String? tradeType;
  final String? asset;
  final String? fiatUnit;
  final dynamic advStatus;
  final dynamic priceType;
  final dynamic priceFloatingRatio;
  final dynamic rateFloatingRatio;
  final dynamic currencyRate;
  final String? price;
  final dynamic initAmount;
  final String? surplusAmount;
  final dynamic amountAfterEditing;
  final String? maxSingleTransAmount;
  final String? minSingleTransAmount;
  final dynamic buyerKycLimit;
  final dynamic buyerRegDaysLimit;
  final dynamic buyerBtcPositionLimit;
  final dynamic remarks;
  final String? autoReplyMsg;
  final int? payTimeLimit;
  final List<TradeMethod>? tradeMethods;
  final dynamic userTradeCountFilterTime;
  final dynamic userBuyTradeCountMin;
  final dynamic userBuyTradeCountMax;
  final dynamic userSellTradeCountMin;
  final dynamic userSellTradeCountMax;
  final dynamic userAllTradeCountMin;
  final dynamic userAllTradeCountMax;
  final dynamic userTradeCompleteRateFilterTime;
  final dynamic userTradeCompleteCountMin;
  final dynamic userTradeCompleteRateMin;
  final dynamic userTradeVolumeFilterTime;
  final dynamic userTradeType;
  final dynamic userTradeVolumeMin;
  final dynamic userTradeVolumeMax;
  final dynamic userTradeVolumeAsset;
  final dynamic createTime;
  final dynamic advUpdateTime;
  final dynamic fiatVo;
  final dynamic assetVo;
  final dynamic advVisibleRet;
  final dynamic assetLogo;
  final int? assetScale;
  final int? fiatScale;
  final int? priceScale;
  final String? fiatSymbol;
  final bool? isTradable;
  final String? dynamicMaxSingleTransAmount;
  final String? minSingleTransQuantity;
  final String? maxSingleTransQuantity;
  final String? dynamicMaxSingleTransQuantity;
  final String? tradableQuantity;
  final String? commissionRate;
  final dynamic takerCommissionRate;
  final List<dynamic>? tradeMethodCommissionRates;
  final dynamic launchCountry;
  final dynamic abnormalStatusList;
  final dynamic closeReason;
  final dynamic storeInformation;
  final dynamic allowTradeMerchant;

  Adv({
    this.advNo,
    this.classify,
    this.tradeType,
    this.asset,
    this.fiatUnit,
    this.advStatus,
    this.priceType,
    this.priceFloatingRatio,
    this.rateFloatingRatio,
    this.currencyRate,
    this.price,
    this.initAmount,
    this.surplusAmount,
    this.amountAfterEditing,
    this.maxSingleTransAmount,
    this.minSingleTransAmount,
    this.buyerKycLimit,
    this.buyerRegDaysLimit,
    this.buyerBtcPositionLimit,
    this.remarks,
    this.autoReplyMsg,
    this.payTimeLimit,
    this.tradeMethods,
    this.userTradeCountFilterTime,
    this.userBuyTradeCountMin,
    this.userBuyTradeCountMax,
    this.userSellTradeCountMin,
    this.userSellTradeCountMax,
    this.userAllTradeCountMin,
    this.userAllTradeCountMax,
    this.userTradeCompleteRateFilterTime,
    this.userTradeCompleteCountMin,
    this.userTradeCompleteRateMin,
    this.userTradeVolumeFilterTime,
    this.userTradeType,
    this.userTradeVolumeMin,
    this.userTradeVolumeMax,
    this.userTradeVolumeAsset,
    this.createTime,
    this.advUpdateTime,
    this.fiatVo,
    this.assetVo,
    this.advVisibleRet,
    this.assetLogo,
    this.assetScale,
    this.fiatScale,
    this.priceScale,
    this.fiatSymbol,
    this.isTradable,
    this.dynamicMaxSingleTransAmount,
    this.minSingleTransQuantity,
    this.maxSingleTransQuantity,
    this.dynamicMaxSingleTransQuantity,
    this.tradableQuantity,
    this.commissionRate,
    this.takerCommissionRate,
    this.tradeMethodCommissionRates,
    this.launchCountry,
    this.abnormalStatusList,
    this.closeReason,
    this.storeInformation,
    this.allowTradeMerchant,
  });

  Adv copyWith({
    String? advNo,
    String? classify,
    String? tradeType,
    String? asset,
    String? fiatUnit,
    dynamic advStatus,
    dynamic priceType,
    dynamic priceFloatingRatio,
    dynamic rateFloatingRatio,
    dynamic currencyRate,
    String? price,
    dynamic initAmount,
    String? surplusAmount,
    dynamic amountAfterEditing,
    String? maxSingleTransAmount,
    String? minSingleTransAmount,
    dynamic buyerKycLimit,
    dynamic buyerRegDaysLimit,
    dynamic buyerBtcPositionLimit,
    dynamic remarks,
    String? autoReplyMsg,
    int? payTimeLimit,
    List<TradeMethod>? tradeMethods,
    dynamic userTradeCountFilterTime,
    dynamic userBuyTradeCountMin,
    dynamic userBuyTradeCountMax,
    dynamic userSellTradeCountMin,
    dynamic userSellTradeCountMax,
    dynamic userAllTradeCountMin,
    dynamic userAllTradeCountMax,
    dynamic userTradeCompleteRateFilterTime,
    dynamic userTradeCompleteCountMin,
    dynamic userTradeCompleteRateMin,
    dynamic userTradeVolumeFilterTime,
    dynamic userTradeType,
    dynamic userTradeVolumeMin,
    dynamic userTradeVolumeMax,
    dynamic userTradeVolumeAsset,
    dynamic createTime,
    dynamic advUpdateTime,
    dynamic fiatVo,
    dynamic assetVo,
    dynamic advVisibleRet,
    dynamic assetLogo,
    int? assetScale,
    int? fiatScale,
    int? priceScale,
    String? fiatSymbol,
    bool? isTradable,
    String? dynamicMaxSingleTransAmount,
    String? minSingleTransQuantity,
    String? maxSingleTransQuantity,
    String? dynamicMaxSingleTransQuantity,
    String? tradableQuantity,
    String? commissionRate,
    dynamic takerCommissionRate,
    List<dynamic>? tradeMethodCommissionRates,
    dynamic launchCountry,
    dynamic abnormalStatusList,
    dynamic closeReason,
    dynamic storeInformation,
    dynamic allowTradeMerchant,
  }) =>
      Adv(
        advNo: advNo ?? this.advNo,
        classify: classify ?? this.classify,
        tradeType: tradeType ?? this.tradeType,
        asset: asset ?? this.asset,
        fiatUnit: fiatUnit ?? this.fiatUnit,
        advStatus: advStatus ?? this.advStatus,
        priceType: priceType ?? this.priceType,
        priceFloatingRatio: priceFloatingRatio ?? this.priceFloatingRatio,
        rateFloatingRatio: rateFloatingRatio ?? this.rateFloatingRatio,
        currencyRate: currencyRate ?? this.currencyRate,
        price: price ?? this.price,
        initAmount: initAmount ?? this.initAmount,
        surplusAmount: surplusAmount ?? this.surplusAmount,
        amountAfterEditing: amountAfterEditing ?? this.amountAfterEditing,
        maxSingleTransAmount: maxSingleTransAmount ?? this.maxSingleTransAmount,
        minSingleTransAmount: minSingleTransAmount ?? this.minSingleTransAmount,
        buyerKycLimit: buyerKycLimit ?? this.buyerKycLimit,
        buyerRegDaysLimit: buyerRegDaysLimit ?? this.buyerRegDaysLimit,
        buyerBtcPositionLimit:
            buyerBtcPositionLimit ?? this.buyerBtcPositionLimit,
        remarks: remarks ?? this.remarks,
        autoReplyMsg: autoReplyMsg ?? this.autoReplyMsg,
        payTimeLimit: payTimeLimit ?? this.payTimeLimit,
        tradeMethods: tradeMethods ?? this.tradeMethods,
        userTradeCountFilterTime:
            userTradeCountFilterTime ?? this.userTradeCountFilterTime,
        userBuyTradeCountMin: userBuyTradeCountMin ?? this.userBuyTradeCountMin,
        userBuyTradeCountMax: userBuyTradeCountMax ?? this.userBuyTradeCountMax,
        userSellTradeCountMin:
            userSellTradeCountMin ?? this.userSellTradeCountMin,
        userSellTradeCountMax:
            userSellTradeCountMax ?? this.userSellTradeCountMax,
        userAllTradeCountMin: userAllTradeCountMin ?? this.userAllTradeCountMin,
        userAllTradeCountMax: userAllTradeCountMax ?? this.userAllTradeCountMax,
        userTradeCompleteRateFilterTime: userTradeCompleteRateFilterTime ??
            this.userTradeCompleteRateFilterTime,
        userTradeCompleteCountMin:
            userTradeCompleteCountMin ?? this.userTradeCompleteCountMin,
        userTradeCompleteRateMin:
            userTradeCompleteRateMin ?? this.userTradeCompleteRateMin,
        userTradeVolumeFilterTime:
            userTradeVolumeFilterTime ?? this.userTradeVolumeFilterTime,
        userTradeType: userTradeType ?? this.userTradeType,
        userTradeVolumeMin: userTradeVolumeMin ?? this.userTradeVolumeMin,
        userTradeVolumeMax: userTradeVolumeMax ?? this.userTradeVolumeMax,
        userTradeVolumeAsset: userTradeVolumeAsset ?? this.userTradeVolumeAsset,
        createTime: createTime ?? this.createTime,
        advUpdateTime: advUpdateTime ?? this.advUpdateTime,
        fiatVo: fiatVo ?? this.fiatVo,
        assetVo: assetVo ?? this.assetVo,
        advVisibleRet: advVisibleRet ?? this.advVisibleRet,
        assetLogo: assetLogo ?? this.assetLogo,
        assetScale: assetScale ?? this.assetScale,
        fiatScale: fiatScale ?? this.fiatScale,
        priceScale: priceScale ?? this.priceScale,
        fiatSymbol: fiatSymbol ?? this.fiatSymbol,
        isTradable: isTradable ?? this.isTradable,
        dynamicMaxSingleTransAmount:
            dynamicMaxSingleTransAmount ?? this.dynamicMaxSingleTransAmount,
        minSingleTransQuantity:
            minSingleTransQuantity ?? this.minSingleTransQuantity,
        maxSingleTransQuantity:
            maxSingleTransQuantity ?? this.maxSingleTransQuantity,
        dynamicMaxSingleTransQuantity:
            dynamicMaxSingleTransQuantity ?? this.dynamicMaxSingleTransQuantity,
        tradableQuantity: tradableQuantity ?? this.tradableQuantity,
        commissionRate: commissionRate ?? this.commissionRate,
        takerCommissionRate: takerCommissionRate ?? this.takerCommissionRate,
        tradeMethodCommissionRates:
            tradeMethodCommissionRates ?? this.tradeMethodCommissionRates,
        launchCountry: launchCountry ?? this.launchCountry,
        abnormalStatusList: abnormalStatusList ?? this.abnormalStatusList,
        closeReason: closeReason ?? this.closeReason,
        storeInformation: storeInformation ?? this.storeInformation,
        allowTradeMerchant: allowTradeMerchant ?? this.allowTradeMerchant,
      );

  factory Adv.fromJson(Map<String, dynamic> json) => Adv(
        advNo: json["advNo"],
        classify: json["classify"],
        tradeType: json["tradeType"],
        asset: json["asset"],
        fiatUnit: json["fiatUnit"],
        advStatus: json["advStatus"],
        priceType: json["priceType"],
        priceFloatingRatio: json["priceFloatingRatio"],
        rateFloatingRatio: json["rateFloatingRatio"],
        currencyRate: json["currencyRate"],
        price: json["price"],
        initAmount: json["initAmount"],
        surplusAmount: json["surplusAmount"],
        amountAfterEditing: json["amountAfterEditing"],
        maxSingleTransAmount: json["maxSingleTransAmount"],
        minSingleTransAmount: json["minSingleTransAmount"],
        buyerKycLimit: json["buyerKycLimit"],
        buyerRegDaysLimit: json["buyerRegDaysLimit"],
        buyerBtcPositionLimit: json["buyerBtcPositionLimit"],
        remarks: json["remarks"],
        autoReplyMsg: json["autoReplyMsg"],
        payTimeLimit: json["payTimeLimit"],
        tradeMethods: json["tradeMethods"] == null
            ? []
            : List<TradeMethod>.from(
                json["tradeMethods"]!.map((x) => TradeMethod.fromJson(x))),
        userTradeCountFilterTime: json["userTradeCountFilterTime"],
        userBuyTradeCountMin: json["userBuyTradeCountMin"],
        userBuyTradeCountMax: json["userBuyTradeCountMax"],
        userSellTradeCountMin: json["userSellTradeCountMin"],
        userSellTradeCountMax: json["userSellTradeCountMax"],
        userAllTradeCountMin: json["userAllTradeCountMin"],
        userAllTradeCountMax: json["userAllTradeCountMax"],
        userTradeCompleteRateFilterTime:
            json["userTradeCompleteRateFilterTime"],
        userTradeCompleteCountMin: json["userTradeCompleteCountMin"],
        userTradeCompleteRateMin: json["userTradeCompleteRateMin"],
        userTradeVolumeFilterTime: json["userTradeVolumeFilterTime"],
        userTradeType: json["userTradeType"],
        userTradeVolumeMin: json["userTradeVolumeMin"],
        userTradeVolumeMax: json["userTradeVolumeMax"],
        userTradeVolumeAsset: json["userTradeVolumeAsset"],
        createTime: json["createTime"],
        advUpdateTime: json["advUpdateTime"],
        fiatVo: json["fiatVo"],
        assetVo: json["assetVo"],
        advVisibleRet: json["advVisibleRet"],
        assetLogo: json["assetLogo"],
        assetScale: json["assetScale"],
        fiatScale: json["fiatScale"],
        priceScale: json["priceScale"],
        fiatSymbol: json["fiatSymbol"],
        isTradable: json["isTradable"],
        dynamicMaxSingleTransAmount: json["dynamicMaxSingleTransAmount"],
        minSingleTransQuantity: json["minSingleTransQuantity"],
        maxSingleTransQuantity: json["maxSingleTransQuantity"],
        dynamicMaxSingleTransQuantity: json["dynamicMaxSingleTransQuantity"],
        tradableQuantity: json["tradableQuantity"],
        commissionRate: json["commissionRate"],
        takerCommissionRate: json["takerCommissionRate"],
        tradeMethodCommissionRates: json["tradeMethodCommissionRates"] == null
            ? []
            : List<dynamic>.from(
                json["tradeMethodCommissionRates"]!.map((x) => x)),
        launchCountry: json["launchCountry"],
        abnormalStatusList: json["abnormalStatusList"],
        closeReason: json["closeReason"],
        storeInformation: json["storeInformation"],
        allowTradeMerchant: json["allowTradeMerchant"],
      );

  Map<String, dynamic> toJson() => {
        "advNo": advNo,
        "classify": classify,
        "tradeType": tradeType,
        "asset": asset,
        "fiatUnit": fiatUnit,
        "advStatus": advStatus,
        "priceType": priceType,
        "priceFloatingRatio": priceFloatingRatio,
        "rateFloatingRatio": rateFloatingRatio,
        "currencyRate": currencyRate,
        "price": price,
        "initAmount": initAmount,
        "surplusAmount": surplusAmount,
        "amountAfterEditing": amountAfterEditing,
        "maxSingleTransAmount": maxSingleTransAmount,
        "minSingleTransAmount": minSingleTransAmount,
        "buyerKycLimit": buyerKycLimit,
        "buyerRegDaysLimit": buyerRegDaysLimit,
        "buyerBtcPositionLimit": buyerBtcPositionLimit,
        "remarks": remarks,
        "autoReplyMsg": autoReplyMsg,
        "payTimeLimit": payTimeLimit,
        "tradeMethods": tradeMethods == null
            ? []
            : List<dynamic>.from(tradeMethods!.map((x) => x.toJson())),
        "userTradeCountFilterTime": userTradeCountFilterTime,
        "userBuyTradeCountMin": userBuyTradeCountMin,
        "userBuyTradeCountMax": userBuyTradeCountMax,
        "userSellTradeCountMin": userSellTradeCountMin,
        "userSellTradeCountMax": userSellTradeCountMax,
        "userAllTradeCountMin": userAllTradeCountMin,
        "userAllTradeCountMax": userAllTradeCountMax,
        "userTradeCompleteRateFilterTime": userTradeCompleteRateFilterTime,
        "userTradeCompleteCountMin": userTradeCompleteCountMin,
        "userTradeCompleteRateMin": userTradeCompleteRateMin,
        "userTradeVolumeFilterTime": userTradeVolumeFilterTime,
        "userTradeType": userTradeType,
        "userTradeVolumeMin": userTradeVolumeMin,
        "userTradeVolumeMax": userTradeVolumeMax,
        "userTradeVolumeAsset": userTradeVolumeAsset,
        "createTime": createTime,
        "advUpdateTime": advUpdateTime,
        "fiatVo": fiatVo,
        "assetVo": assetVo,
        "advVisibleRet": advVisibleRet,
        "assetLogo": assetLogo,
        "assetScale": assetScale,
        "fiatScale": fiatScale,
        "priceScale": priceScale,
        "fiatSymbol": fiatSymbol,
        "isTradable": isTradable,
        "dynamicMaxSingleTransAmount": dynamicMaxSingleTransAmount,
        "minSingleTransQuantity": minSingleTransQuantity,
        "maxSingleTransQuantity": maxSingleTransQuantity,
        "dynamicMaxSingleTransQuantity": dynamicMaxSingleTransQuantity,
        "tradableQuantity": tradableQuantity,
        "commissionRate": commissionRate,
        "takerCommissionRate": takerCommissionRate,
        "tradeMethodCommissionRates": tradeMethodCommissionRates == null
            ? []
            : List<dynamic>.from(tradeMethodCommissionRates!.map((x) => x)),
        "launchCountry": launchCountry,
        "abnormalStatusList": abnormalStatusList,
        "closeReason": closeReason,
        "storeInformation": storeInformation,
        "allowTradeMerchant": allowTradeMerchant,
      };
}

class TradeMethod {
  final dynamic payId;
  final String? payMethodId;
  final dynamic payType;
  final dynamic payAccount;
  final dynamic payBank;
  final dynamic paySubBank;
  final String? identifier;
  final dynamic iconUrlColor;
  final String? tradeMethodName;
  final String? tradeMethodShortName;
  final String? tradeMethodBgColor;

  TradeMethod({
    this.payId,
    this.payMethodId,
    this.payType,
    this.payAccount,
    this.payBank,
    this.paySubBank,
    this.identifier,
    this.iconUrlColor,
    this.tradeMethodName,
    this.tradeMethodShortName,
    this.tradeMethodBgColor,
  });

  TradeMethod copyWith({
    dynamic payId,
    String? payMethodId,
    dynamic payType,
    dynamic payAccount,
    dynamic payBank,
    dynamic paySubBank,
    String? identifier,
    dynamic iconUrlColor,
    String? tradeMethodName,
    String? tradeMethodShortName,
    String? tradeMethodBgColor,
  }) =>
      TradeMethod(
        payId: payId ?? this.payId,
        payMethodId: payMethodId ?? this.payMethodId,
        payType: payType ?? this.payType,
        payAccount: payAccount ?? this.payAccount,
        payBank: payBank ?? this.payBank,
        paySubBank: paySubBank ?? this.paySubBank,
        identifier: identifier ?? this.identifier,
        iconUrlColor: iconUrlColor ?? this.iconUrlColor,
        tradeMethodName: tradeMethodName ?? this.tradeMethodName,
        tradeMethodShortName: tradeMethodShortName ?? this.tradeMethodShortName,
        tradeMethodBgColor: tradeMethodBgColor ?? this.tradeMethodBgColor,
      );

  factory TradeMethod.fromJson(Map<String, dynamic> json) => TradeMethod(
        payId: json["payId"],
        payMethodId: json["payMethodId"],
        payType: json["payType"],
        payAccount: json["payAccount"],
        payBank: json["payBank"],
        paySubBank: json["paySubBank"],
        identifier: json["identifier"],
        iconUrlColor: json["iconUrlColor"],
        tradeMethodName: json["tradeMethodName"],
        tradeMethodShortName: json["tradeMethodShortName"],
        tradeMethodBgColor: json["tradeMethodBgColor"],
      );

  Map<String, dynamic> toJson() => {
        "payId": payId,
        "payMethodId": payMethodId,
        "payType": payType,
        "payAccount": payAccount,
        "payBank": payBank,
        "paySubBank": paySubBank,
        "identifier": identifier,
        "iconUrlColor": iconUrlColor,
        "tradeMethodName": tradeMethodName,
        "tradeMethodShortName": tradeMethodShortName,
        "tradeMethodBgColor": tradeMethodBgColor,
      };
}

class Advertiser {
  final String? userNo;
  final dynamic realName;
  final String? nickName;
  final dynamic margin;
  final dynamic marginUnit;
  final dynamic orderCount;
  final int? monthOrderCount;
  final double? monthFinishRate;
  final double? positiveRate;
  final dynamic advConfirmTime;
  final dynamic email;
  final dynamic registrationTime;
  final dynamic mobile;
  final String? userType;
  final List<dynamic>? tagIconUrls;
  final int? userGrade;
  final String? userIdentity;
  final dynamic proMerchant;
  final List<String>? badges;
  final dynamic isBlocked;
  final int? activeTimeInSecond;

  Advertiser({
    this.userNo,
    this.realName,
    this.nickName,
    this.margin,
    this.marginUnit,
    this.orderCount,
    this.monthOrderCount,
    this.monthFinishRate,
    this.positiveRate,
    this.advConfirmTime,
    this.email,
    this.registrationTime,
    this.mobile,
    this.userType,
    this.tagIconUrls,
    this.userGrade,
    this.userIdentity,
    this.proMerchant,
    this.badges,
    this.isBlocked,
    this.activeTimeInSecond,
  });

  Advertiser copyWith({
    String? userNo,
    dynamic realName,
    String? nickName,
    dynamic margin,
    dynamic marginUnit,
    dynamic orderCount,
    int? monthOrderCount,
    double? monthFinishRate,
    double? positiveRate,
    dynamic advConfirmTime,
    dynamic email,
    dynamic registrationTime,
    dynamic mobile,
    String? userType,
    List<dynamic>? tagIconUrls,
    int? userGrade,
    String? userIdentity,
    dynamic proMerchant,
    List<String>? badges,
    dynamic isBlocked,
    int? activeTimeInSecond,
  }) =>
      Advertiser(
        userNo: userNo ?? this.userNo,
        realName: realName ?? this.realName,
        nickName: nickName ?? this.nickName,
        margin: margin ?? this.margin,
        marginUnit: marginUnit ?? this.marginUnit,
        orderCount: orderCount ?? this.orderCount,
        monthOrderCount: monthOrderCount ?? this.monthOrderCount,
        monthFinishRate: monthFinishRate ?? this.monthFinishRate,
        positiveRate: positiveRate ?? this.positiveRate,
        advConfirmTime: advConfirmTime ?? this.advConfirmTime,
        email: email ?? this.email,
        registrationTime: registrationTime ?? this.registrationTime,
        mobile: mobile ?? this.mobile,
        userType: userType ?? this.userType,
        tagIconUrls: tagIconUrls ?? this.tagIconUrls,
        userGrade: userGrade ?? this.userGrade,
        userIdentity: userIdentity ?? this.userIdentity,
        proMerchant: proMerchant ?? this.proMerchant,
        badges: badges ?? this.badges,
        isBlocked: isBlocked ?? this.isBlocked,
        activeTimeInSecond: activeTimeInSecond ?? this.activeTimeInSecond,
      );

  factory Advertiser.fromJson(Map<String, dynamic> json) => Advertiser(
        userNo: json["userNo"],
        realName: json["realName"],
        nickName: json["nickName"],
        margin: json["margin"],
        marginUnit: json["marginUnit"],
        orderCount: json["orderCount"],
        monthOrderCount: json["monthOrderCount"],
        monthFinishRate: json["monthFinishRate"]?.toDouble(),
        positiveRate: json["positiveRate"]?.toDouble(),
        advConfirmTime: json["advConfirmTime"],
        email: json["email"],
        registrationTime: json["registrationTime"],
        mobile: json["mobile"],
        userType: json["userType"],
        tagIconUrls: json["tagIconUrls"] == null
            ? []
            : List<dynamic>.from(json["tagIconUrls"]!.map((x) => x)),
        userGrade: json["userGrade"],
        userIdentity: json["userIdentity"],
        proMerchant: json["proMerchant"],
        badges: json["badges"] == null
            ? []
            : List<String>.from(json["badges"]!.map((x) => x)),
        isBlocked: json["isBlocked"],
        activeTimeInSecond: json["activeTimeInSecond"],
      );

  Map<String, dynamic> toJson() => {
        "userNo": userNo,
        "realName": realName,
        "nickName": nickName,
        "margin": margin,
        "marginUnit": marginUnit,
        "orderCount": orderCount,
        "monthOrderCount": monthOrderCount,
        "monthFinishRate": monthFinishRate,
        "positiveRate": positiveRate,
        "advConfirmTime": advConfirmTime,
        "email": email,
        "registrationTime": registrationTime,
        "mobile": mobile,
        "userType": userType,
        "tagIconUrls": tagIconUrls == null
            ? []
            : List<dynamic>.from(tagIconUrls!.map((x) => x)),
        "userGrade": userGrade,
        "userIdentity": userIdentity,
        "proMerchant": proMerchant,
        "badges":
            badges == null ? [] : List<dynamic>.from(badges!.map((x) => x)),
        "isBlocked": isBlocked,
        "activeTimeInSecond": activeTimeInSecond,
      };
}

////
///
///
// To parse this JSON data, do
//
//     final biananceP2PResponse = biananceP2PResponseFromJson(jsonString);
 // To parse this JSON data, do
//
//     final biananceTradeRateResponse = biananceTradeRateResponseFromJson(jsonString);

 

List<BiananceTradeRateResponse> biananceTradeRateResponseFromJson(String str) => List<BiananceTradeRateResponse>.from(json.decode(str).map((x) => BiananceTradeRateResponse.fromJson(x)));

String biananceTradeRateResponseToJson(List<BiananceTradeRateResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BiananceTradeRateResponse {
    final String? eventTime;
    final int? e;
    final String? s;
    final String? priceChangePercent;
    final String? p;
    final String? w;
    final String? lastPrice;
    final String? q;
    final String? openPrice;
    final String? h;
    final String? lowPrice;
    final String? v;
    final String? lastQuantity;
    final int? o;
    final int? c;
    final int? f;
    final int? l;
    final int? n;

    BiananceTradeRateResponse({
        this.eventTime,
        this.e,
        this.s,
        this.priceChangePercent,
        this.p,
        this.w,
        this.lastPrice,
        this.q,
        this.openPrice,
        this.h,
        this.lowPrice,
        this.v,
        this.lastQuantity,
        this.o,
        this.c,
        this.f,
        this.l,
        this.n,
    });

    BiananceTradeRateResponse copyWith({
        String? biananceTradeRateResponseE,
        int? e,
        String? s,
        String? biananceTradeRateResponseP,
        String? p,
        String? w,
        String? biananceTradeRateResponseC,
        String? q,
        String? biananceTradeRateResponseO,
        String? h,
        String? biananceTradeRateResponseL,
        String? v,
        String? biananceTradeRateResponseQ,
        int? o,
        int? c,
        int? f,
        int? l,
        int? n,
    }) => 
        BiananceTradeRateResponse(
            eventTime: biananceTradeRateResponseE ?? this.eventTime,
            e: e ?? this.e,
            s: s ?? this.s,
            priceChangePercent: biananceTradeRateResponseP ?? this.priceChangePercent,
            p: p ?? this.p,
            w: w ?? this.w,
            lastPrice: biananceTradeRateResponseC ?? this.lastPrice,
            q: q ?? this.q,
            openPrice: biananceTradeRateResponseO ?? this.openPrice,
            h: h ?? this.h,
            lowPrice: biananceTradeRateResponseL ?? this.lowPrice,
            v: v ?? this.v,
            lastQuantity: biananceTradeRateResponseQ ?? this.lastQuantity,
            o: o ?? this.o,
            c: c ?? this.c,
            f: f ?? this.f,
            l: l ?? this.l,
            n: n ?? this.n,
        );

    factory BiananceTradeRateResponse.fromJson(Map<String, dynamic> json) => BiananceTradeRateResponse(
        eventTime: json["e"],
        e: json["E"],
        s: json["s"],
        priceChangePercent: json["P"],
        p: json["p"],
        w: json["w"],
        lastPrice: json[""],
        q: json["Q"],
        openPrice: json["o"],
        h: json["h"],
        lowPrice: json["l"],
        v: json["v"],
        lastQuantity: json["q"],
        o: json["O"],
        c: json["C"],
        f: json["F"],
        l: json["L"],
        n: json["N"],
    );

    Map<String, dynamic> toJson() => {
        "e": eventTime,
        "E": e,
        "s": s,
        "p": priceChangePercent,
        "P": p,
        "w": w,
        "c": lastPrice,
        "Q": q,
        "o": openPrice,
        "h": h,
        "l": lowPrice,
        "v": v,
        "q": lastQuantity,
        "O": o,
        "C": c,
        "F": f,
        "L": l,
        "n": n,
    };
}


////


List<BiananceMarketPriceResponse> biananceMarketPriceResponseFromJson(
        String str) =>
    List<BiananceMarketPriceResponse>.from(
        json.decode(str).map((x) => BiananceMarketPriceResponse.fromJson(x)));

String biananceMarketPriceResponseToJson(
        List<BiananceMarketPriceResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BiananceMarketPriceResponse {
  final String? eE;
  final int? e;
  final String? s;
  final String? pP;
  final String? p;
  final String? i;
  final String? r;
  final int? t;

  BiananceMarketPriceResponse({
    this.eE,
    this.e,
    this.s,
    this.pP,
    this.p,
    this.i,
    this.r,
    this.t,
  });

  BiananceMarketPriceResponse copyWith({
    String? biananceMarketPriceResponseE,
    int? e,
    String? s,
    String? biananceMarketPriceResponseP,
    String? p,
    String? i,
    String? r,
    int? t,
  }) =>
      BiananceMarketPriceResponse(
        eE:
            biananceMarketPriceResponseE ?? this.eE,
        e: e ?? this.e,
        s: s ?? this.s,
        pP:
            biananceMarketPriceResponseP ?? this.pP,
        p: p ?? this.p,
        i: i ?? this.i,
        r: r ?? this.r,
        t: t ?? this.t,
      );

  factory BiananceMarketPriceResponse.fromJson(Map<String, dynamic> json) =>
      BiananceMarketPriceResponse(
        eE: json["e"],
        e: json["E"],
        s: json["s"],
        pP: json["p"],
        p: json["P"],
        i: json["i"],
        r: json["r"],
        t: json["T"],
      );

  Map<String, dynamic> toJson() => {
        "e": eE,
        "E": e,
        "s": s,
        "p": pP,
        "P": p,
        "i": i,
        "r": r,
        "T": t,
      };
}
