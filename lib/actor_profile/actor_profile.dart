import 'package:breaking_bad_characters/home_page/controller/home_page_controller.dart';
import 'package:breaking_bad_characters/models/characters-model.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class ActorProfile extends StatelessWidget {
  final CharacterModel character;

  const ActorProfile({Key key, this.character}) : super(key: key);



  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Wrap(

              direction: Axis.vertical,
        spacing: 40,
        children: [

            Text('Bithday :'+ character.birthday,style: fontmiddlesize,),
            Text('Occupation :'+character.occupation[1].toString(),style: fontmiddlesize,),
            Text('Status :'+character.status,style: fontmiddlesize,),
            Text('Appearance :'+character.appearance.length.toString(),style: fontmiddlesize,),
            Text('Portrayed :'+character.portrayed,style: fontmiddlesize,),


        ],
    ),
          ),
    );
  }
}
