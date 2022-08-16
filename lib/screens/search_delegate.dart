import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_peliculas/providers/movies_provider.dart';

import '../models/movie.dart';


class MovieSearchDelegate extends SearchDelegate{

  @override
  String? get searchFieldLabel => ' Buscar Pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon (Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon( Icons.arrow_back ),
      onPressed: () {
        close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text ('buildResults');
  }

  Widget _enptyContainer() {
      return const Center(
        child:Icon( 
          Icons.movie_creation_outlined, 
          color: Colors.purple, 
          size:130,
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query.isEmpty) {
      return _enptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {

        if ( !snapshot.hasData) return _enptyContainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: ( _, int index) => _MovieItem(movies[index] )
        );
      }, 
    );
  }
}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem( this.movie );

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage( movie.fullPosterImg ),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text ( movie.title ),
      subtitle: Text ( movie.originalTitle ),
      onTap: () {

        Navigator.popAndPushNamed(context, 'details', arguments: movie );
      },
    );
  }
}