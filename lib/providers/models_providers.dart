import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/models/models_model.dart';
import 'package:flutter_chat_gpt/services/api_service.dart';

class ModelsProvider with ChangeNotifier{

   String currentModel='code-davinci-edit-001';
   String get getCurrentModel{
     return currentModel;
   }

   void setCurrentModel(String newModel){
     currentModel=newModel;
     notifyListeners();
   }

   List<ModelsModel> modelList=[];
   List<ModelsModel> get getModelList{
     return modelList;
   }

   Future<List<ModelsModel>> getAllModels()async{

     modelList=await ApiService.getModel();
     return modelList;
   }
}