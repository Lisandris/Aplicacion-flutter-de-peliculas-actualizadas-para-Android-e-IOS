
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  String _apiKey   = '2e86f21261fb190766ac8c699878ebdf';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = []; // [] es un arrai vacio [k, m, m, n, h, f]

  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');
  
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData( String endpoint, [int page = 1]) async{
    var url = Uri.https( _baseUrl, endpoint, {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '$page'

    });
  
    final response =await http.get(url);
    return response.body;

  }

  getOnDisplayMovies() async {

    final jsonData = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson( jsonData);
    
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage ++;

    final jsonData = await _getJsonData('/3/movie/popular', _popularPage );
    final popularResponse = PopularResponse.fromJson( jsonData );

    popularMovies = [ ...popularMovies, ...popularResponse.results];
    notifyListeners();

  }

}
