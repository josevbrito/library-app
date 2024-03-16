import 'package:cryptocode/layouts/functions/text.dart';
import 'package:flutter/material.dart';
import 'package:cryptocode/layouts/appbar.dart';

class DecryptionPage extends StatefulWidget {
  const DecryptionPage({super.key});

  @override
  State<DecryptionPage> createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Decryption'),
      body: Center(child: TextModel(content: 'Ecryption', sizeText: 14, peso: 'normal')),
    );
  }
}