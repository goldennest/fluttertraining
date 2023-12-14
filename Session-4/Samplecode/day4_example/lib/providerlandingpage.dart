import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/shimmerwidget.dart';
import 'component/stockinfowidget.dart';
import 'component/timeserieschart.dart';
import 'provider/stock_provider.dart';

class ProviderLandingPage extends StatefulWidget {
  const ProviderLandingPage({super.key});

  @override
  State<ProviderLandingPage> createState() => _ProviderLandingPageState();
}

class _ProviderLandingPageState extends State<ProviderLandingPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<StockProvider>().loadstock("INFY");
    });
    super.initState();
  }

  alertmsg() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Stock List"),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            GestureDetector(
              child: const Text("INFY"),
              onTap: () {
                context.read<StockProvider>().loadstock("INFY");
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: const Text("RELIANCE"),
              onTap: () {
                context.read<StockProvider>().loadstock("RELIANCE");

                Navigator.pop(context);
              },
            ),
          ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Consumer<StockProvider>(
            builder: (context, provider, child) {
              if (provider.isloadinginfo) {
                return ShimmerWidget.rectangular(
                  width: 100,
                  height: 50,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                );
              }

              return Text(provider.info!.symbol!);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  alertmsg();
                },
                icon: Icon(Icons.sell_rounded))
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [StockInfoWidget(), TimeSeriesChart()],
          ),
        ));
  }
}
