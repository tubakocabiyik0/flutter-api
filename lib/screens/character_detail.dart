import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/Model/CharactersC.dart';

class CharacterDetail extends StatefulWidget {
  String imageUrl;
  String characterName;
  CharactersC c;
  int index;


  CharacterDetail({this.imageUrl, this.characterName, this.c, this.index});

  @override
  State<StatefulWidget> createState() {
    return StateD();
  }

}

class StateD extends State<CharacterDetail> {
  String gender;
  String species;
  int i;

  @override
  Widget build(BuildContext context) {
    if (widget.characterName != null) {
      for (i = 0; i < 20; i++) {
        if (widget.characterName == widget.c.results[i].name) {
          gender = widget.c.results[i].gender;
          species = widget.c.results[i].species;

        }
      }
    }
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.brown.shade300,
        title: Text(widget.characterName),),
      body: body(),
    );
  }

  body() {
    return Container(
      color: Colors.brown.shade50,
      child: Stack(

        children: [
          Positioned(

              top: 40,
              bottom: 40,
              right: 10,
              left: 10,
              child:Container(
                color: Colors.red.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.network(widget.imageUrl),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Name : "+widget.characterName ,style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Speciest : "+species,style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Gender : "+ gender,style: TextStyle(fontSize: 20),),
                  ),

                ],),
              )
          )

        ],
      ),


    );
  }

}