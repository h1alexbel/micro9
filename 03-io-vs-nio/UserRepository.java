interface UserRepository extends ReactiveRepository {

  Mono<User> findById(Long id);

  Flux<User> findAllByFirstName(String firstname);
}