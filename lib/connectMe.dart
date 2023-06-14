import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ConnectMePage extends StatelessWidget {
  const ConnectMePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Me'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                'https://example.com/your-image.jpg'),
          ),
          const SizedBox(height: 20),
          const Text('Get Started', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.videocam),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
              ),
            ],
          ),
        ],
      ),
    );
  }
}