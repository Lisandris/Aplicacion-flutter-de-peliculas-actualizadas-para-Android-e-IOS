import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    // TODO: cambiar luego por una isntancia de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';


    return Scaffold(
      body: CustomScrollView(
         slivers: [
          _CustomAppBar()
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
