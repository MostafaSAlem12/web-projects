import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  final String? name;
  final double? value;
  final bool isLoading;
  const CurrencyWidget(
      {super.key, this.name, this.value, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.80,
      height: size.height * 0.80,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          width: 10,
          color: Colors.deepPurple,
        ),
      ),
      child: Center(
        child: FittedBox(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            child: isLoading
                ? CircularProgressIndicator(
                    key: ValueKey<bool?>(isLoading),
                    color: Colors.purpleAccent.shade400,
                  )
                : name != null && value != null
                    ? Row(
                        key: const ValueKey<String>('data'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "$value",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            name!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        'Error',
                        key: ValueKey<String>('error'),
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
