import 'package:breaking_bad_characters/models/characters-model.dart';
import 'package:dio/dio.dart';

class HomeController {

  Future<List<CharacterModel>> getData()async{
    final response = await Dio().get('https://www.breakingbadapi.com/api/characters');
    final data = response.data as List;
    List<CharacterModel> dartList = [];

    data.forEach((element) {
      dartList.add(CharacterModel.fromJson(element));
    });

    return dartList;
  }

}