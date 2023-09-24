import 'package:cached_network_image/cached_network_image.dart';
import 'package:cexl/my_providers.dart';
import 'package:cexl/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CryptoExchangeRateDemo extends HookConsumerWidget {
  const CryptoExchangeRateDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCtrl = useTextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bianance Exchange Rates"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              controller: searchCtrl,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), label: Text("Filter")),
            ),
            Expanded(
              child: ref.watch(marketPriceStreamProvider).maybeWhen(
                    orElse: () {
                      return const Center(
                        child: Text("Somethign wrong"),
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (marketData) {
                      return ref.watch(bTradeRateProvider).maybeWhen(
                            orElse: () {
                              return const Center(
                                child: Text("Something wrong"),
                              );
                            },
                            error: (error, stackTrace) => Center(
                              child: Text(error.toString()),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            data: (data) {
                              final names = ref.watch(
                                  CryptoNameProvider(filter: searchCtrl.text));
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  final k = names[index];
                                  final changePercent = double.tryParse(
                                          data[k]?.priceChangePercent ??
                                              '0.0') ??
                                      0;
                                  return ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "$cryptoIconsBaseURL/${k.replaceAll('USDT', '').toLowerCase()}",
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(k),
                                          ],
                                        ),
                                        Text(double.parse(marketData[k]?.p ??
                                                marketPriceCache[k]?.p ??
                                                '0.0')
                                            .toStringAsFixed(3))
                                      ],
                                    ),
                                    trailing: SizedBox(
                                      width: 80,
                                      child: Text(
                                        "${data[k]?.priceChangePercent ?? cachedData[k]?.priceChangePercent ?? 0}%",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: changePercent > 0
                                                ? Colors.green
                                                : changePercent < 0
                                                    ? Colors.red
                                                    : Colors.black),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: names.length,
                              );
                            },
                          );
                    },
                  ),
            ),
          ],
        ));
  }
}
