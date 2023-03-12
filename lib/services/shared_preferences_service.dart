import '../models/models.dart';

class SharedPreferencesServices {
  SharedPreferencesServices();

  List<Map<String, dynamic>> listToJsonList(List<MovieModel> lista) {
    List<Map<String, dynamic>> listaDeMapas = [];
    for (var objeto in lista) {
      listaDeMapas.add(objeto.toJson());
    }
    return listaDeMapas;
  }

  List<MovieModel> listFromMap(List<Map<String, dynamic>> lista) {
    List<MovieModel> listaDeObjetos = [];
    for (var mapa in lista) {
      listaDeObjetos.add(MovieModel.fromJson(mapa));
    }
    return listaDeObjetos;
  }
}
