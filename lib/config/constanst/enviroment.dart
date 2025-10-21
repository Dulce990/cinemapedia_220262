import 'package:flutter_dotenv/flutter_dotenv.dart';
//clase para manejar las variables de entorno del archivo .env
// aqui se puede agregar cualquier variable de entorno que se necesite en la aplicación
//en este caso solo se agrega la clave de la API de The Movie DB
class Environment {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No API Key';
  
}
