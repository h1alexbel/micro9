public interface Publisher<T> {
  public void subscribe(Subscriber<? super T> s);
}