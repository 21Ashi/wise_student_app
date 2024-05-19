import 'package:flutter/material.dart';

class CustomRowWithLines extends StatelessWidget {
  const CustomRowWithLines({
    super.key,
    required this.firstValue,
    required this.firstLabel,
    required this.secondValue,
    required this.secondLabel,
    required this.thirdValue,
    required this.thirdLabel,
  });

  final String firstValue;
  final String firstLabel;
  final String secondValue;
  final String secondLabel;
  final String thirdValue;
  final String thirdLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildColumn(context, firstValue, firstLabel),
          _buildDivider(context),
          _buildColumn(context, secondValue, secondLabel),
          _buildDivider(context),
          _buildColumn(context, thirdValue, thirdLabel),
        ],
      ),
    );
  }

  Widget _buildColumn(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        Text(label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Theme.of(context).colorScheme.primary,
            )),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      width: 1,
      height: 30,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
