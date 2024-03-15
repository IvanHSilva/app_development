import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";

const request = "https://api.hgbrasil.com/finance?format=json&key=99c2efe3";

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}

class CoinConversor extends StatefulWidget {
  const CoinConversor({super.key});

  @override
  State<CoinConversor> createState() => _CoinConversorState();
}

class _CoinConversorState extends State<CoinConversor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "\$ Conversor de Moedas \$",
          style: TextStyle(
            color: Colors.yellow[50],
          ),
        ),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
