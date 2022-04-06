import 'package:flutter/material.dart';
import 'package:pattern_setstate/model/post_model.dart';
import 'package:pattern_setstate/view_models/edit_viewmodel.dart';
import 'package:pattern_setstate/views/widget_textfield.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  Post? post;
  static final String id = "/edit_page";

  EditPage({Key? key, required this.post}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  EditViewModel editViewModel = EditViewModel();

  @override
  void initState() {
    super.initState();
    editViewModel.editPagePost(widget.post!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Post"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              editViewModel.apiEditData(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: ChangeNotifierProvider<EditViewModel>(
          create: (context) => editViewModel,
          child: Consumer<EditViewModel>(
            builder: (ctx, model, index) => Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  texformField(hintext: "Title", controller: editViewModel.titleController),
                  texformField(hintext: "Body", controller: editViewModel.bodyController),
                ],
              ),
            ),
          )
      ),
    );
  }
}
