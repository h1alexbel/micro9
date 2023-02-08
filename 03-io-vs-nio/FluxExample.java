class FluxExample {
  public static void main(String[] args) {
    Flux<String> seq1 = Flux.just("foo", "bar", "foobar");
    List<String> iterable = Arrays.asList("foo", "bar", "foobar");
    Flux<String> seq2 = Flux.fromIterable(iterable);
    Flux<Integer> range = Flux.range(1, 25);
  }
}