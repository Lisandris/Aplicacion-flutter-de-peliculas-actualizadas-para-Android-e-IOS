import 'package:flutter/material.dart';


class MovieSlider extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20 ),
            child: Text( 'Populares', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ) ,) ,
          ),

          const SizedBox ( height: 5),
          
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _, int index) => _MoviePoster()
            ),
          ),
        ],
      ),
    );
  }
}

 class _MoviePoster extends StatelessWidget {
 
   @override
   Widget build(BuildContext context) {
     return Container(
        width: 130,
        height: 190,
        margin: EdgeInsets.symmetric( horizontal: 10),
        child: Column(
          children: [

            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage('https://mitiendademascotas.co/wp-content/uploads/2021/09/gatos-300x400.jpg'),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox( height: 5 ),

            const Text(
              'Starwars: El retorno del nuevo Jedi Silvestre',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
   }
 }