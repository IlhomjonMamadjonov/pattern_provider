import 'package:flutter/material.dart';
import 'package:pattern_setstate/view_models/home_viewmodel.dart';
import 'package:pattern_setstate/views/item_of_post.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id="home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel=HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.apiPostList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: ChangeNotifierProvider(
        create: (context)=>viewModel,
        child: Consumer<HomeViewModel>(
          builder: (context,model,index)=>Stack(
            children: [
              ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (ctx, index){return itemOfPost(viewModel,viewModel.items[index]);}),
              viewModel.isLoading?Center(child: CircularProgressIndicator(),):SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        onPressed: (){
          viewModel.goToCreatePage(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
