import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_assignment/services/api_service.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ApiService.logout();
              Get.offNamed('/');
            },
          ),
          const Text(
            "Log Out",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
