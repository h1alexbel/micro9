@Configuration
@RequiredArgsConstructor
class UserRoutes {

  private final Users user;

  @Bean
  public RouterFunction<ServerResponse> user() {
    return RouterFunctions.route()
      .GET("/api/v1/users/{id}",
        req ->
          ServerResponse.ok().body(
            this.users.findById(req.pathVariable("id")), User.class
          )
      ).build();
  }
}