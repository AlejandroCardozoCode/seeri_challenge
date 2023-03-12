# seeri_challenge
Aquí se encuentra el código desarrollado para la nueva técnica 

# Capturas de la app
![app](https://user-images.githubusercontent.com/57674935/224557346-606efc46-2c15-47d8-b545-2c0842e8ba27.png)

# Arquitectura y patrones
Para la arquitectura del desarrollo de la aplicación se implementó una adaptación de MVC junto con el patrón Bloc, la idea principal de la aplicación es mantener los componentes de la presentación, lógica y modelado separados para lograr reusabilidad y en un futuro fácil adaptabilidad.

# Librerias y Modulos

  ## Librerias
  API Peliculas: www.themoviedb.org

  ## modulos
    flutter_bloc: Para uso del patrón Bloc y mantener estados dentro de la aplicación 
    card_swiper: Para presentar las películas relevantes del momento
    http: Para manejar las peticiones al API de www.themoviedb.org
    readmore: Para manejar de manera más sencilla los textos en la descripción de películas y reviews
    flutter_rating_bar: Para mostrar la puntuación de las películas
    flutter_dotenv: Para almacenar variables de entorno
    shared_preferences: Para gestionar los shared preferences
