@Controller
public class PostController {

  private Posts posts;

  @QueryMapping
  public List<Post> recentPosts(@Argument int count, @Argument int offset) {
    return posts.recent(count, offset);
  }
}