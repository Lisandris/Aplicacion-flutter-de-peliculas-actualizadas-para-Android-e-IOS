
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  String _apiKey   = '2e86f21261fb190766ac8c699878ebdf';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');
  
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing' , {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '1'

    });
  
    final response =await http.get(url);
    final nowPlayingResponde = NowPlayingResponse.fromJson( response.body);
    

    onDisplayMovies = nowPlayingResponde.results;

    notifyListeners();
  
  }

}
