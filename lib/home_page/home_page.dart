import 'package:breaking_bad_characters/actor_profile/actor_profile.dart';
import 'package:breaking_bad_characters/models/characters-model.dart';
import 'package:flutter/material.dart';

import 'controller/home_page_controller.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller = HomeController();
  List<CharacterModel> data = [];
  bool _isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }
  void getData()async{
    data = await _controller.getData();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breaking Bad Actors")
      ),
      body:  _isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: data.length,
       itemBuilder: (context, index) {
      final char = data[index];
      return Container(
        padding: EdgeInsets.only(top: 20),
        child: ListTile(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ActorProfile(character:char)));
          },
          title: Text(
            char.name,
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            char.nickname,
            style: TextStyle(fontSize:18.0, fontWeight: FontWeight.bold),

          ),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width/6,
              minHeight: MediaQuery.of(context).size.width/5,
              maxWidth: MediaQuery.of(context).size.width/6,
              maxHeight: MediaQuery.of(context).size.width/5,
            ),
            child: Image.network(char.img, fit: BoxFit.cover),
          ),
        ),
      );

    }

      ),
    );
  }
}

