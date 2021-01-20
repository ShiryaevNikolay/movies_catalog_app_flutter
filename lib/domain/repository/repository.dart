class Repository {
  
  static final Repository _repository = Repository._internal();

  factory Repository() => _repository;

  Repository._internal();

  Future fetchMovie() {

  }
}