import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_setstate/model/post_model.dart';

import '../services/http_service.dart';

class CreateViewModel extends ChangeNotifier{
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();


  void apiCreatePost(BuildContext context) async{
    isLoading = true;
    notifyListeners();


    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    Post post =Post(title: title, body: body, userId: body.hashCode);
    String? result = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if (kDebugMode) {
      print(result.toString());
    }
    if(result != null){
      Navigator.pop(context,result);
    }
    else{
    }
    notifyListeners();
  }
}