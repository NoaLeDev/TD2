import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/openweathermap_api.dart';
import '../models/location.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  String query = '';
  Future<Iterable<Location>>? locationsSearchResults;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      var api = context.read<OpenWeatherMapApi>();

      return Scaffold(
        appBar: AppBar(
          title: const Text('Recherche'),
        ),
        body: Column(children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Rechercher',
            ),
            onChanged: (value) => query = value,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                locationsSearchResults = api.searchLocations(query);
              });
            },
            child: const Text("Rechercher"),
          ),
          if (query.isEmpty)
            const Text('Saisissez une ville dans la barre de recherche.')
          else
            FutureBuilder(
              future: locationsSearchResults,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Une erreur est survenue.\n${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return const Text('Aucun résultat pour cette recherche.');
                }

                return Column(children: [
                  for (var word in snapshot.data!)
                    ListTile(
                      title: Text(word.toString()),
                    )
                ]);
              },
            )
        ]),
      );
    });
  }
}
