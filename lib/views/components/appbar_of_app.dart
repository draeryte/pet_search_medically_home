import 'package:flutter/material.dart';

AppBar appBar = AppBar(
  title: const Text('Pet Search'),
  centerTitle: false,
  actions: [
    //  IconButton(
    //       onPressed: (){
    //         //view favorite list
    //       },
    //       icon: const Icon(
    //         Icons.favorite,
    //         color: Colors.white,
    //       )),
    TextButton(
        onPressed: () {
          print('was pressed');
        },
        child: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white),
        ))
  ],
);
