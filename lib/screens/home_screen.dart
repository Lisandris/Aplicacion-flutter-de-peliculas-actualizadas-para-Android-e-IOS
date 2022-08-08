import 'package:app_peliculas/widgets/card_swiper.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 0,
        actions: [
         IconButton(
          icon: Icon( Icons.search_outlined),
          onPressed: () {},
         )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // tarejtas principales
           CardSwiper(),

           //  slider de peluclas
           MovieSlider(),
           


            // Listado horizontal de peliculas
          ],
        )
      )
    );
    
  }
}