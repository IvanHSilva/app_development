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

  void _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
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
                          "Reais",
                          "R\$ ",
                          Theme.of(context).hintColor,
                          realController,
                          _realChanged),
                      const Divider(),
                      buildTextField(
                          "Dólares",
                          "US\$ ",
                          Theme.of(context).hintColor,
                          dolarController,
                          _dolarChanged),
                      const Divider(),
                      buildTextField(
                          "Euros",
                          "€\$ ",
                          Theme.of(context).hintColor,
                          euroController,
                          _euroChanged),
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

Widget buildTextField(String label, String prefix, Color color,
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
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
      ),
      focusedBorder: InputBorder.none,
    ),
    style: const TextStyle(
      color: Colors.amber,
      fontSize: 20,
    ),
  );
}
