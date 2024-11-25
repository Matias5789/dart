import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ConversionScreen extends StatefulWidget {
  const ConversionScreen({super.key});

  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  final TextEditingController _btcController = TextEditingController();
  double _conversionRate = 0.0;
  final String _currency = 'USD';

  Future<void> _getConversionRate() async {
    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=$_currency'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _conversionRate = data['bitcoin'][_currency.toLowerCase()];
      });

      // Save the conversion in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('last_conversion', 'BTC $_btcController.text = $_conversionRate $_currency');
    } else {
      throw Exception('Failed to load conversion rate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _btcController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantidade de BTC'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _getConversionRate,
            child: const Text('Converter'),
          ),
          const SizedBox(height: 16),
          if (_conversionRate > 0)
            Text('$_btcController.text BTC = ${_conversionRate.toStringAsFixed(2)} $_currency'),
        ],
      ),
    );
  }
}
