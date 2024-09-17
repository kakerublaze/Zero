class Endpoints {
  // --> Base URL
  static const String baseUrl = 'consumet-api-repo.vercel.app';
  static const String moviesBaseUrl = 'api.themoviedb.org/3';

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
  static const String popularMovies = 'movie/popular';
  // --> Popular Celebs
  static const String popularCelebs = '';
  // --> Top Rated Movies
  static const String topRatedMovies = 'movie/top_rated';
  // --> Upcoming Movies
  static const String upcomingMovies = 'movie/upcoming';
  // --> Trending Movies
  static const String trendingMovies =
      'trending/movie'; //{time_window} day/ week
  // --> Trending Celebs
  static const String trendingCelebs =
      'trending/person'; //{time_window}' day/ week
  // --> Trending Series
  static const String trendingSeries = 'trending/tv'; //{time_window}' day/ week
  // --> Popular Series
  static const String popularSeries = 'tv/popular';
  // --> Top Rated Series
  static const String topRatedSeries = 'tv/top_rated';
}
