class MovieNetwork {

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

  MovieNetwork({
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

  factory MovieNetwork.fromJson(Map<String, dynamic> json) => MovieNetwork(
    mId: json["id"],
    mTitle: json["title"],
    mOverview: json["overview"],
    mPosterPath: json["poster_path"],
    mReleaseDate: json["release_date"]
  );
}