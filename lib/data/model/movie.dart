class Movie {

  int mId;
  String mPosterPath;
  bool mAdult;
  String mOverview;
  String mReleaseDate;
  List<int> mGenreIds;
  String mOriginalTitle;
  String mOriginalLanguage;
  String mTitle;
  String mBackdropPath;
  int mPopularity;
  String mVoteCount;
  bool mVideo;
  int mVoteAverage;

  Movie({
    this.mId, 
    this.mPosterPath, 
    this.mAdult, 
    this.mOverview, 
    this.mReleaseDate, 
    this.mGenreIds, 
    this.mOriginalTitle, 
    this.mOriginalLanguage, 
    this.mTitle,
    this.mBackdropPath,
    this.mPopularity,
    this.mVoteCount,
    this.mVideo,
    this.mVoteAverage
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    mId: json["id"],
    mTitle: json["title"],
    mOverview: json["overview"],
    mPosterPath: json["poster_path"],
    mReleaseDate: json["release_date"]
  );
}