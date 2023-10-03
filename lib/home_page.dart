import 'package:cexl/crypto_exchange_page.dart';
import 'package:cexl/example_page.dart';
import 'package:cexl/my_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyRef = ref.watch(currentMMKExchangeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("MM Currency Exchange"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            currencyRef.maybeWhen(
              orElse: () => const Center(
                child: Text("Something wrong."),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              data: (data) {
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(currentMMKExchangeProvider);
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${data[index].code}"),
                        trailing: Text(
                          "${(data[index].value ?? 0.0).toStringAsFixed(2)} MMK",
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    },
                    itemCount: data.length,
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Crypto exchange rate"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CryptoExchangeRateDemo(),
                    ));
              },
            ),
            ListTile(
              title: const Text("Example page"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExamplePage(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
