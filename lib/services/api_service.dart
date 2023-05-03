import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_chat_gpt/constants/api_consts.dart';
import 'package:flutter_chat_gpt/models/models_model.dart';
import 'package:http/http.dart'as http;
class ApiService{

  static Future<List<ModelsModel>> getModel()async{

    try{
     var response=await http.get(Uri.parse('$BASE_URL/models'),headers:{
       'Authorization':'Bearer $API_KEY'
     });
      Map jsonResponse=jsonDecode(response.body);

      //print('jsonResponse1 $jsonResponse');

      if(jsonResponse['error']!=null){
       // print("jsonResponse['error']: ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
       List temp=[];
      for(var value in jsonResponse['data']){
        temp.add(value);
        log('temp ${value['id']}');
      }
      return ModelsModel.modelsFromSnapshot(temp);
    }catch(e){
       log('error $e');
       rethrow;

    }

  }
}