@FeignClient(name = "stores", url = "${api.url}", configuration = FooConfiguration.class)
public interface StoreClient {
  @GetMapping(value = "/stores", produces = "application/xml")
  List<Store> stores();

  @GetMapping("/stores")
  Page<Store> stores(Pageable pageable);

  @PutMapping(url = "/stores/{storeId}", consumes = "application/json")
  Store update(@PathVariable Long storeId, Store store);

  @DeleteMapping(value = "/stores/{storeId:\\d+}")
  void delete(@PathVariable Long storeId);
}