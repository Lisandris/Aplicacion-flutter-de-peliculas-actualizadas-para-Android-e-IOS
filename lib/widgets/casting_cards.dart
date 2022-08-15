import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/credits_response.dart';
import '../providers/movies_provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;
  
  const CastingCards(this.movieId);

    @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMoviesCast(movieId),
      builder: ( _, AsyncSnapshot<List<Cast>> snapshot) {
      
      if ( !snapshot.hasData) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 150) ,
          height: 180,
          child: const CupertinoActivityIndicator(),
        );
        // boton de carga
      }

      final List<Cast> cast =snapshot.data!;

        return Container(
         margin: EdgeInsets.only( bottom: 30 ),
         width: double.infinity,
         height: 190,
         child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder:( _, int index) => _CastCard(),
           ),
        );
      },
    );
  }
}
class _CastCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/150x300'),
                height: 140,
                width: 100,
                fit: BoxFit.cover,
            ),
          ),

          const SizedBox( height: 5),
          const Text(
            'actor.name asdkasd asasd',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ]
      ),

    );
  }
}