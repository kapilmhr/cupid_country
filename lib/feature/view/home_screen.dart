import 'package:cupid_country/core/constants.dart';
import 'package:cupid_country/routes/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => _handleSubmitButton(context),
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }


  void _handleSubmitButton(BuildContext context) {
    Map<String, dynamic> args = {
      Constants.country: '',
      Constants.state: '',
    };
    Navigator.pushNamed(context, Routes.detail, arguments: args);
  }
}
