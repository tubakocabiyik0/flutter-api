import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/Model/Results.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/screens/EpisodeDetail.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateHome();
  }


}
class StateHome extends State<HomePage>{
  Future<Model> future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future=getData();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
         appBar: AppBar(backgroundColor: Colors.brown.shade300,title: Text("Episode List"),),
         body: homeBody(),
  );
  }

  homeBody() {
    return FutureBuilder(
        future: future,
        builder:(context,AsyncSnapshot<Model> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (context,index){
              return Container(
                color: Colors.brown.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                      child: ListTile(
                        tileColor: Colors.brown.shade50,
                        title: Text(snapshot.data.results[index].name),
                        subtitle: Text(snapshot.data.results[index].episode),
                        leading: Image.network("https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DetailPage(result:snapshot.data.results[index]) ));
                        },
                      )
                  ),
                ),
              );
            });
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        });
  }
  Future<Model> getData() async{
    String url ="https://rickandmortyapi.com/api/episode";
    var response= await http.get(url);
    var jsonO=jsonDecode(response.body);
    return Model.fromJson(jsonO);


  }

}