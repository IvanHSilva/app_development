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
  late double dolar;
  late double euro;

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
                dolar = snapshot.data!["results"]["currencies"]["EUR"]["buy"];

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
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Reais",
                          labelStyle: const TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                          ),
                          prefixText: "R\$ ",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                        ),
                      ),
                      const Divider(),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Dólares",
                          labelStyle: const TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                          ),
                          prefixText: "US\$ ",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                        ),
                      ),
                      const Divider(),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Euros",
                          labelStyle: const TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                          ),
                          prefixText: "€\$ ",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                        ),
                      ),
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
