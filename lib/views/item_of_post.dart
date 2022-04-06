import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_setstate/model/post_model.dart';
import 'package:pattern_setstate/view_models/home_viewmodel.dart';

Widget itemOfPost(HomeViewModel homeViewModel ,Post post){
  return Slidable(
    endActionPane: ActionPane(
      extentRatio: 0.25,
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){
            homeViewModel.apiPostDelete(post);
          },
          flex: 3,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        )
      ],
    ),
    startActionPane: ActionPane(
      extentRatio: 0.25,
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){
            homeViewModel.goToEditPage(post,context);
          },
          flex: 3,
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        )
      ],
    ),
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top:20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title!.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5,),
          Text(post.body!),
        ],
      ),
    ),
  );
}