import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/stock_provider.dart';
import 'shimmerwidget.dart';

class StockInfoWidget extends StatelessWidget {
  const StockInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StockProvider>(builder: (context, provider, _) {
      if (provider.isloadinginfo) {
        return ShimmerWidget.rectangular(
          width: 100,
          height: 120,
          shapeBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Company Name : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text("${provider.info?.name}"),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Description :",
            textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
                  const SizedBox(
              height: 10,
            ),
            Text("${provider.info?.description}")
          ],
        ),
      );
    });
  }
}
