import 'package:flutter/material.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Companies Screen',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );  }
}