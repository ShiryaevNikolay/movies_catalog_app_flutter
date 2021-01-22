class MovieNetwork {

  int mId;
  String mPosterPath;
  String mOverview;
  String mReleaseDate;
  String mTitle;
  bool mIsFavorite;

  MovieNetwork({
    this.mId, 
    this.mPosterPath, 
    this.mOverview, 
    this.mReleaseDate, 
    this.mTitle,
    this.mIsFavorite
  });

  factory MovieNetwork.fromJson(Map<String, dynamic> json) => MovieNetwork(
    mId: json["id"],
    mTitle: json["title"],
    mOverview: json["overview"],
    mPosterPath: json["poster_path"],
    mReleaseDate: json["release_date"]
  );
}