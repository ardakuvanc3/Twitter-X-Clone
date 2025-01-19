class Tweets {
  int id;
  String name;
  String userName;
  String Date;
  String avatar;
  int like;
  int comment;
  int repost;
  int views;
  String tweetContent;
  Tweets(
      {

        required this.id,
        required this.name,
        required this.userName,
        required this.Date,
        required this.avatar,
        required this.like,
        required this.comment,
        required this.repost,
        required this.tweetContent,
        required this.views});
}