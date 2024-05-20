import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter
import 'package:wise_student_app/Screens/Chat/chat_page.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/reg.dart';

class PaymentHourSelection extends StatefulWidget {
  const PaymentHourSelection({super.key});

  @override
  State<PaymentHourSelection> createState() => _PaymentHourSelectionState();
}

class _PaymentHourSelectionState extends State<PaymentHourSelection> {
  final TextEditingController _paymenthours = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _hasError = false;

  @override
  void dispose() {
    _paymenthours.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _validateInput() {
    final value = int.tryParse(_paymenthours.text);
    setState(() {
      _hasError = value == null || value < 12 || value > 18;
    });
  }

  void _onValidatePressed() {
    _validateInput();
    if (!_hasError) {
      debugPrint('Input is valid: ${_paymenthours.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        title: Text(
          S.of(context).PaymentSelection,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: InkWell(
        onTap: () {
          unFocusKeyboard(context);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                S.of(context).NumberOfHours,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: TextFormField(
                  focusNode: _focusNode,
                  textAlign: TextAlign.center,
                  controller: _paymenthours,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorText: _hasError ? '' : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  style: const TextStyle(height: 1.0),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Text(
                      S.of(context).Summary,
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CustomRowPay(
                        title: S.of(context).SelectedHours,
                        value: _hasError
                            ? '0'
                            : (_paymenthours.text.isNotEmpty
                                ? _paymenthours.text
                                : '0'),
                      ),
                      CustomRowPay(
                          title: S.of(context).HourlyRate, value: '45'),
                      CustomRowPay(
                        title: S.of(context).RegistrationFees,
                        value: "125",
                      ),
                      CustomRowPay(
                        title: S.of(context).TotalHourlyCost,
                        value: _hasError
                            ? '0'
                            : (_hasError
                                    ? 'Error'
                                    : (int.tryParse(_paymenthours.text) ?? 0) *
                                        45)
                                .toString(),
                      ),
                      const Divider(),
                      CustomRowPay(
                        title: S.of(context).Total,
                        value: _hasError
                            ? '0'
                            : (_hasError
                                    ? 'Error'
                                    : (int.tryParse(_paymenthours.text) ?? 0) *
                                            45 +
                                        125)
                                .toString(),
                      ),
                      CustomRowPay(
                        title: S.of(context).SpendingAuthority,
                        value: S.of(context).Private,
                      ),
                      ElevatedButton(
                        onPressed: _onValidatePressed,
                        child: Text(S.of(context).Calculate),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).confirmation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
