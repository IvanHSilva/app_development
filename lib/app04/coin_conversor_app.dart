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
  //
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  late double dolar;
  late double euro;

  void _coinChanged(String text, TextEditingController controller1,
      TextEditingController controller2, int option) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double value = double.parse(text.replaceAll(",", "."));
    if (option == 1) {
      controller1.text = (value / dolar).toStringAsFixed(2);
      controller2.text = (value / euro).toStringAsFixed(2);
    } else {
      controller1.text = (value * dolar).toStringAsFixed(2);
      controller2.text = (value * dolar / euro).toStringAsFixed(2);
    }
  }

  void _realChanged(String text) {
    _coinChanged(text, dolarController, euroController, 1);
  }

  void _dolarChanged(String text) {
    _coinChanged(text, realController, euroController, 2);
  }

  void _euroChanged(String text) {
    _coinChanged(text, realController, dolarController, 3);
  }

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    //
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
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  "Carregado Dados...",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ao Carregar Dados...",
                    style: TextStyle(
                      color: Colors.red[200],
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        size: 120.0,
                        color: Colors.amber,
                      ),
                      //
                      buildTextField(
                          "Reais", "R\$ ", realController, _realChanged),
                      const SizedBox(height: 20.0),
                      buildTextField(
                          "Dólares", "US\$ ", dolarController, _dolarChanged),
                      const SizedBox(height: 20.0),
                      buildTextField(
                          "Euros", "€\$ ", euroController, _euroChanged),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Widget buildTextField(String label, String prefix,
    TextEditingController controller, Function function) {
  return TextField(
    controller: controller,
    onChanged: (text) {
      function(text);
    },
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.amber,
        fontSize: 30,
      ),
      prefixText: prefix,
      //focusedBorder: InputBorder.none,
    ),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 25,
    ),
  );
}
