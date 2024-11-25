import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _lastConversion = '';

  @override
  void initState() {
    super.initState();
    _loadLastConversion();
  }

  _loadLastConversion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastConversion = prefs.getString('last_conversion') ?? 'Nenhuma conversão realizada ainda';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Última Conversão:'),
            const SizedBox(height: 8),
            Text(_lastConversion),
          ],
        ),
      ),
    );
  }
}
