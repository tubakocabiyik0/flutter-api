import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rick_morty/Model/CharactersC.dart';

import 'package:rick_morty/Model/Results.dart';

import 'character_detail.dart';

class DetailPage extends StatefulWidget {
  Result result;

  DetailPage({this.result});

  @override
  State<StatefulWidget> createState() {
    return StateDetail();
  }
}

class StateDetail extends State<DetailPage> {
  Future futureCharacters;
  List<String> characterList;
  List<String> characterImages;
  String characterUrl;
  int i;
  int j;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCharacters = getCharacters();
    setState(() {
      characterList = new List<String>();
      characterImages = new List<String>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Text("Episode Detail"),
      ),
      body: detailBody(),
    );
  }

  detailBody() {
    return Container(
      color: Colors.brown.shade200,
      child: Stack(
        children: [
          Positioned(
              left: 10,
              right: 10,
              top: 40,
              bottom: 40,
              child: Container(
                color: Colors.brown.shade100,
                child: Column(
                  children: [
                    Text(
                      "Characters",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "(click characters for info)",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                          future: getCharacters(),
                          builder:
                              (context, AsyncSnapshot<CharactersC> snapshot) {
                            if (snapshot.hasData) {
                              for (i = 0; i < 20; i++) {
                                for (j = 0;
                                    j < widget.result.characters.length;
                                    j++) {
                                  if (widget.result.characters[j] ==
                                      snapshot.data.results[i].url) {
                                    characterList
                                        .add(snapshot.data.results[i].name);
                                    characterImages
                                        .add(snapshot.data.results[i].image);

                                  }
                                }
                              }
                              return ListView.builder(
                                  itemCount: characterList.length,
                                  itemBuilder: (contex, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (contex) =>
                                                      CharacterDetail(
                                                          characterName:
                                                              characterList[
                                                                  index],c: snapshot.data,index: characterList.length,imageUrl: characterImages[index],  )));
                                        },
                                        leading: Image.network(
                                            characterImages[index]),
                                        title: Text(characterList[index]),
                                      ),
                                    );
                                  });
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Future<CharactersC> getCharacters() async {
    String url = "https://rickandmortyapi.com/api/character";
    var response = await http.get(url);
    var jsonO = jsonDecode(response.body);
    return CharactersC.fromJson(jsonO);
  }
}
