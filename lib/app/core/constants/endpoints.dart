import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  // --> Base URL
  static String baseUrl = dotenv.env['baseUrl'] ?? '';
  static String moviesBaseUrl = dotenv.env['movieUrl'] ?? '';
  static String imageBaseUrl = dotenv.env['imageUrl'] ?? '';
  // --> Airing Schedule API's
  static const String airingScheduleAnime = 'meta/anilist/airing-schedule';
  // --> Recent Anime Episode API's
  static const String recentAnimeEpisodes = 'meta/anilist/recent-episodes';
  // --> Anime Details Data API's
  static const String animeDetailsData = 'meta/anilist/info';
  // --> Anime Streaming Data API's
  static const String animeStream = 'meta/anilist/watch';
  // --> Anime Streaming Data API's
  static const String animeSearch = 'meta/anilist/advanced-search';
  // --> News API's Data
  static const String newsData = 'news/ann/recent-feeds';
  // --> News Details API's Data
  static const String newsDetailsData = 'news/ann/info';
  // --> TMDB Stream
  static const String movieStream = 'meta/tmdb/watch';
  // --> TMDB Info
  static const String movieInfo = 'meta/tmdb/info';
  // --> TMDB Search
  static const String movieSearch = 'meta/tmdb';
  // --> Asian TV Data Info
  static const String asianTVInfo = 'movies/dramacool/info';
  // --> Asain TV Stream
  static const String asianTVStream = 'movies/dramacool/watch';
  // --> Asain TV Search
  static const String asianTVSearch = 'movies/dramacool';

  // --> Popular Movies
  static const String popularMovies = '3/movie/popular';
  // --> Popular Celebs
  static const String popularCelebs = '3/person/popular';
  // --> Top Rated Movies
  static const String topRatedMovies = '3/movie/top_rated';
  // --> Upcoming Movies
  static const String upcomingMovies = '3/movie/upcoming';
  // --> Movies Details
  static const String moviesDetails = '3/movie';
  // --> Trending Movies
  static const String trendingMovies =
      '3/trending/movie'; //{time_window} day/ week
  // --> Trending Celebs
  static const String trendingCelebs =
      '3/trending/person'; //{time_window}' day/ week
  // --> Trending Series
  static const String trendingSeries =
      '3/trending/tv'; //{time_window}' day/ week
  // --> Popular Series
  static const String popularSeries = '3/tv/popular';
  // --> Top Rated Series
  static const String topRatedSeries = '3/tv/top_rated';
}
