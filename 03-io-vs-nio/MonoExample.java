class MonoExample {
  public static void main(String[] args) {
    Mono<String> noData = Mono.empty();
    Mono<String> data = Mono.just("foo");

  }
}