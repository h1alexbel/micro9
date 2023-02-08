class ImmutabilityExample {
  void count() {
    Flux<String> count = Flux
      .fromStream(this.returnStream())
      .take(10)
      .flatMap(
        c -> Flux.zip(Mono.just(c), Mono.fromCompletionStage(this.returnCompletableFuture(c)))
      )
      .map(tuple -> tuple.getT2() + " #" + tuple.getT1()); // count is not there
    count.subscribe(System.out::println); // count is running
  }
}