import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget{
   const  MyAppBar({required this.title, super.key});

   final Widget title;

   @override
   Widget build(BuildContext context){

     return Container(
       height: 56,
       padding: const EdgeInsets.symmetric(horizontal: 8),
       decoration: BoxDecoration(color: Colors.blue[500]),
       child: Row(
         children: [
           const IconButton(
             icon : Icon(Icons.menu),
             tooltip: 'Navigation menu',
             onPressed: null,
           ),
           Expanded(child: title),
           const IconButton(
             icon: Icon(Icons.search),
             tooltip: "Search",
             onPressed: null,
           )
         ],
       )
     );
   }
}