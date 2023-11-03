import 'package:currency_converter/Controller/main_screen_controller.dart';
import 'package:currency_converter/Model/Models/currency_model.dart';
import 'package:currency_converter/View/Widgets/currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Currency Converter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              fontSize: 26,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.purple,
                      Colors.indigo,
                    ]),
              ),
            ),
            Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 3,
                      child: StreamBuilder<CurrencyModel>(
                          stream: context
                              .watch<MainScreenController>()
                              .conversionStream(),
                          builder: (context, snapshot) {
                            return CurrencyWidget(
                              isLoading: snapshot.connectionState ==
                                  ConnectionState.waiting,
                              name: snapshot.data != null
                                  ? snapshot.data!.name
                                  : null,
                              value: snapshot.data != null
                                  ? snapshot.data!.value
                                  : null,
                            );
                          }),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: DropdownButton<String>(
                                value:
                                    context.read<MainScreenController>().from,
                                isExpanded: true,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                                selectedItemBuilder: (context) => context
                                    .read<MainScreenController>()
                                    .currencies
                                    .map(
                                      (currency) => DropdownMenuItem<String>(
                                        value: currency,
                                        child: Text(
                                          currency,
                                          style: const TextStyle(
                                            color: Colors.white54,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                items: context
                                    .read<MainScreenController>()
                                    .currencies
                                    .map(
                                      (currency) => DropdownMenuItem<String>(
                                        value: currency,
                                        child: Text(currency),
                                      ),
                                    )
                                    .toList(),
                                onChanged: context
                                    .read<MainScreenController>()
                                    .setBase,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed:
                                    context.read<MainScreenController>().swap,
                                icon: const Icon(
                                  Icons.swap_horiz,
                                  color: Colors.white54,
                                  size: 32,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DropdownButton<String>(
                                value: context.read<MainScreenController>().to,
                                isExpanded: true,
                                selectedItemBuilder: (context) => context
                                    .read<MainScreenController>()
                                    .currencies
                                    .map(
                                      (currency) => DropdownMenuItem<String>(
                                        value: currency,
                                        child: Text(
                                          currency,
                                          style: const TextStyle(
                                            color: Colors.white54,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                items: context
                                    .read<MainScreenController>()
                                    .currencies
                                    .map(
                                      (currency) => DropdownMenuItem<String>(
                                        value: currency,
                                        child: Text(currency),
                                      ),
                                    )
                                    .toList(),
                                onChanged: context
                                    .read<MainScreenController>()
                                    .convertTo,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
