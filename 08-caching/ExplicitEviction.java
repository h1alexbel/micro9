class ExplicitEviction {

  private final Cache cache;
  private final Client client;

  public static void main(String[] args) {
    this.cache.put(
      1L,
      new Book("Martin Fowler", "Refactoring", "0134757599")
    );
    this.client.book(1L); // from cache
    this.cache.evict(1L);
    this.client.book(1L); // from db
  }
}