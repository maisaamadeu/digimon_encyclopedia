import 'package:digimon_encyclopedia/api/api.dart';
import 'package:digimon_encyclopedia/api/digimon.dart';
import 'package:digimon_encyclopedia/models/digimon_model.dart';
import 'package:digimon_encyclopedia/repository/digimons_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<DigimonModel>> listDigimons;

  @override
  void initState() {
    super.initState();
    listDigimons = DigimonsRepository().getDigimonsRepositoryHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<DigimonModel>>(
        future: listDigimons,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Erro ao carregar os dados :D',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            snapshot.data![index].img.toString(),
                            scale: 1,
                          ),
                          title: Text(
                            snapshot.data![index].name.toString(),
                          ),
                          subtitle: Text(
                            snapshot.data![index].level.toString(),
                          ),
                        ),
                      );
                    });
              }
          }
        },
      ),
    );
  }
}
