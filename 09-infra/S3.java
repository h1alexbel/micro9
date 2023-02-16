class S3 {
  public static void main(String[] args) {
    AWSCredentials credentials = new BasicAWSCredentials(
      "<AWS accesskey>",
      "<AWS secretkey>"
    );
    AmazonS3 s3 = AmazonS3ClientBuilder.standard()
      .withCredentials(new AWSStaticCredentialsProvider(credentials))
      .withRegion(Regions.US_EAST_2)
      .build();
    s3.createBucket("user_images");
    s3.putObject(
      bucketName,
      "Document/jeff.png",
      new File("jeff.png")
    );
  }
}