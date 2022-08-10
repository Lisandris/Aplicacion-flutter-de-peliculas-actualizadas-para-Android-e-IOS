import 'package:app_peliculas/widgets/card_swiper.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

      final moviesProvider = Provider.of<MoviesProvider>(context);

      print (moviesProvider.onDisplayMovies);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
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
           CardSwiper( movies: moviesProvider.onDisplayMovies),

           //  slider de peluclas
           MovieSlider(),
           


            // Listado horizontal de peliculas
          ],
        )
      )
    );
    
  }
}