import 'dart:js';

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    // TODO: cambiar luego por una isntancia de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';


    return Scaffold(
      body: CustomScrollView(
         slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle()
              
            ])
          )
        ],
      )
    );
  
  }
}


class   _CustomAppBar extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepPurple,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0) ,
        title: Container( 
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: const Text(
              'movie.title',
              style: TextStyle( fontSize: 16),
            ),
        ),
        

          background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'), 
            image: NetworkImage('https://curiosfera-animales.com/wp-content/uploads/2016/09/El-car%C3%A1cter-del-gato-domestico.jpg'),
            fit: BoxFit.cover,
          ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      margin: EdgeInsets.only( top:20),
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
               image: NetworkImage( 'https://via.placeholder.com/200x300'),
               height: 150,
            ),
          ),

          SizedBox( width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text( 'movie.tilte' , style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text( 'movie.originalTitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),

              Row(
                children: [
                  Icon( Icons.star_border_outlined, size: 20, color: Colors.amber),
                  SizedBox( width: 5),
                  Text('movie.vote.voteAvergage', style: textTheme.caption )
                ],
              )
            ]
          )
        ]
      ),
    );
  }
}