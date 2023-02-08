class RestExample {

  private final RestTemplate rest;

  public ResponseEntity<String> fetch(final String url) {
    return rest.getForEntity(url + "/1", String.class);
  }

  public static void main(String[] args) {
    final ResponseEntity<String> entity = new RestExample(
      new RestTemplate()
    ).fetch("http://localhost:8080/spring-rest/foos");
  }
}