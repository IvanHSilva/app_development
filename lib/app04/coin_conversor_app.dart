import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";

const request = "https://api.hgbrasil.com/finance?format=json&key=99c2efe3";

class CoinConversor extends StatelessWidget {
  const CoinConversor({super.key});

  void respConv() async {
    http.Response response = await http.get(Uri.parse(request));
    json.decode(response.body)["results"]["currencies"];
  }

  @override
  Widget build(BuildContext context) {
    respConv;
    return const Placeholder();
  }
}
