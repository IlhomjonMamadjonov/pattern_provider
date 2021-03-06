import 'package:flutter/material.dart';
import 'package:pattern_setstate/model/post_model.dart';
import 'package:pattern_setstate/pages/create_page.dart';
import 'package:pattern_setstate/pages/edit_page.dart';

import '../services/http_service.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Post> items = [];

  Future apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }

  Future apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    if (response != null) {
      apiPostList();
    }
    isLoading = false;
    notifyListeners();
  }

  Future goToEditPage(Post post,BuildContext context) async{
    String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPage(post: post,)));
    Post newPost = Network.parsePost(result);
    items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
    notifyListeners();
  }

  Future goToCreatePage(BuildContext context) async{
    String? result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreatePage()));
    if(result == null) return;
    items.add(Network.parsePost(result));
    notifyListeners();
  }
}
