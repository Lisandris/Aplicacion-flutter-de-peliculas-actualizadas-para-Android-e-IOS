import 'package:flutter/material.dart';


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

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query.isEmpty) {
      return const Center(
        child:Icon( 
          Icons.movie_creation_outlined, 
          color: Colors.purple, 
          size:130,
        )
      );
    }

    return Container();
  }


}