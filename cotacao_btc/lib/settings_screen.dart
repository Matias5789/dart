import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedCurrency = 'USD';

  _saveCurrency(String currency) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selected_currency', currency);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text('Selecione a moeda para conversão'),
            ListTile(
              title: const Text('USD'),
              leading: Radio<String>(
                value: 'USD',
                groupValue: _selectedCurrency,
                onChanged: (value) {
                  setState(() {
                    _selectedCurrency = value!;
                    _saveCurrency(_selectedCurrency);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('EUR'),
              leading: Radio<String>(
                value: 'EUR',
                groupValue: _selectedCurrency,
                onChanged: (value) {
                  setState(() {
                    _selectedCurrency = value!;
                    _saveCurrency(_selectedCurrency);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('BRL'),
              leading: Radio<String>(
                value: 'BRL',
                groupValue: _selectedCurrency,
                onChanged: (value) {
                  setState(() {
                    _selectedCurrency = value!;
                    _saveCurrency(_selectedCurrency);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
