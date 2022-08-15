import 'package:app_peliculas/screens/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import '../providers/movies_provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
         IconButton(
          icon: const Icon( Icons.search_outlined),
          onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate() ),
         )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // tarejtas principales
           CardSwiper( movies: moviesProvider.onDisplayMovies),

           //  slider de peliculas
           MovieSlider(
            movies: moviesProvider.popularMovies,
            title:  'Populares' ,
            onNextPage: () => moviesProvider.getPopularMovies(),
          
           ),
            // Listado horizontal de peliculas
          ],
        )
      )
    );
    
  }
}