
import 'package:app_peliculas/models/search_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  String _apiKey   = '2e86f21261fb190766ac8c699878ebdf';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = []; // [] es un arrai vacio [k, m, m, n, h, f]

  Map<int, List<Cast>> moviesCast ={};

  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');
  
    getOnDisplayMovies();
    getPopularMovies();
  }

  

  Future<String> _getJsonData( String endpoint, [int page = 1]) async{
    final url = Uri.https( _baseUrl, endpoint, {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '$page'

    });
    
    final response = await http.get(url);
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

  Future<List<Cast>> getMoviesCast ( int movieId )  async {

   if (moviesCast.containsKey(movieId) ) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('/3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson( jsonData );
 
    // para almacenar en el mapa
    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

    Future<List<Movie>> searchMovies( String query ) async{
      
      final url = Uri.https( _baseUrl, '/3/search/movie', {
      'api_key' : _apiKey,
      'language' : _language,
      'query': query
      });

      final response = await http.get(url);
      final searchResponse = SearchResponse.fromJson( response.body );
    
      return searchResponse.results;
    }

}
