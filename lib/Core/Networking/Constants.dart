class Constants {
  static const String apikey = "a961a1c0e0d72aca2b97335285874bcd";
  static const String BaseUrl = "https://api.themoviedb.org/3/movie/";
  static const String baseUrlimage = "https://image.tmdb.org/t/p/w500";
  //static const String UrlDetaisMovie = "${BaseUrl}4985647?api_key=$apikey";

  static String baseurlimage({required String imagepath}) {
    return "${baseUrlimage}${imagepath}";
  }
static String baseurlMoviedetails(int id){
  return "${BaseUrl}$id?api_key=$apikey";
}
static String baseurlMoviedetailsRecommendation(int id){
  return "${BaseUrl}$id/recommendations?api_key=$apikey";
}

}
