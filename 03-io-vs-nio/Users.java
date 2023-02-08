class Users {

  private final UserRepository repository;

  public Mono<User> user(Long id) {
    return this.repository.findById(id);
  }

  public Mono<User> transform() {
    return this.repository.findById(1L)
      .flatMap(
        user -> {
          user.setInfo(new UserInfo("Palo Alto/CA", "Safari", "h1alexbel/transformed"));
          return Mono.just(user);
        }
      );
  }
}