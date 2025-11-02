class Constants {
  static const String apikey = "a961a1c0e0d72aca2b97335285874bcd";
  static const String BaseUrl = "https://api.themoviedb.org/3/movie/";
  static const String baseUrlimage = "https://image.tmdb.org/t/p/w500";
  static String baseurlimage({required String imagepath}) {
    return "${baseUrlimage}${imagepath}";
  }
}

