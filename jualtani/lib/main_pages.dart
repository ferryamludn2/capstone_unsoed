import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  final websiteUri = Uri.parse("https://frontend-tanijual.vercel.app/");
  MainPage({super.key});

  final List<Map<String, String>> products = [
    {
      'image': 'assets/images/cabe.png',
      'name': 'Cabai',
      'price': 'Rp.30.000'
    },
    {
      'image': 'assets/images/holtikultura.png',
      'name': 'Kobis',
      'price': 'Rp.40.000'
    },
    {
      'image': 'assets/images/kentang.png',
      'name': 'Kentang',
      'price': 'Rp.25.000'
    },
    {
      'image': 'assets/images/pare.png',
      'name': 'Pare',
      'price': 'Rp.20.000'
    },
    {
      'image': 'assets/images/sawi.png',
      'name': 'Sawi',
      'price': 'Rp.15.000'
    },
    {
      'image': 'assets/images/tomat.png',
      'name': 'Tomat',
      'price': 'Rp.10.000'
    },
    {
      'image': 'assets/images/brokoli.png',
      'name': 'Brokoli',
      'price': 'Rp.10.000'
    },
    {
      'image': 'assets/images/kangkung.png',
      'name': 'Kangkung',
      'price': 'Rp.15.000'
    },
    {
      'image': 'assets/images/o.png',
      'name': 'Others',
      'price': 'Rp.???'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jual Tani"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    product['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product['price']!,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: () async {
                    if (await canLaunchUrl(websiteUri)) {
                      await launchUrl(
                        websiteUri,
                        mode: LaunchMode.inAppWebView,
                      );
                    } else {
                      throw 'Could not launch $websiteUri';
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                       Colors.teal),
                  ),
                  child: const Text(
                    'See Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        child: SizedBox(
          height: 50.0,
          child: Center(
            child: Text(
              "Created by Teknik Elektro21 Capstone 2024",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
