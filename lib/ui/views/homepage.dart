import 'package:flutter/material.dart';
import 'package:x_clone/data/entity/tweets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<Tweets>> loadTweet() async {
    var tweetList = <Tweets>[];
    var t1 = Tweets(id: 1, name: "Arda", userName: "saulte_", Date: "5m", avatar: "avatar1.jpg", like: 1345, comment: 456, repost: 888, views: 168753, tweetContent: "Hello World! :)");
    var t2 = Tweets(id: 2, name: "Emma", userName: "emma_99", Date: "1h", avatar: "avatar2.jpg", like: 340, comment: 25, repost: 12, views: 5600, tweetContent: "Coding is fun! 💻✨");
    var t3 = Tweets(id: 3, name: "Oliver", userName: "oliver_tweets", Date: "3h", avatar: "avatar3.jpg", like: 120, comment: 5, repost: 10, views: 4000, tweetContent: "Just finished a great workout! 💪🏽🏋️");
    var t4 = Tweets(id: 4, name: "Sophia", userName: "sophia_life", Date: "10h", avatar: "avatar4.jpg", like: 450, comment: 30, repost: 20, views: 7500, tweetContent: "Weekend vibes! 🌸🍹");
    var t5 = Tweets(id: 5, name: "Liam", userName: "liam_tech", Date: "1d", avatar: "avatar5.jpg", like: 300, comment: 20, repost: 25, views: 6200, tweetContent: "Flutter or Kotlin? Let’s discuss. 🤔📱");
    var t6 = Tweets(id: 6, name: "Ava", userName: "ava_music", Date: "2d", avatar: "avatar6.jpg", like: 520, comment: 35, repost: 40, views: 8500, tweetContent: "Music heals the soul. 🎶");
    var t7 = Tweets(id: 7, name: "James", userName: "james_blog", Date: "3d", avatar: "avatar7.jpg", like: 180, comment: 10, repost: 8, views: 3200, tweetContent: "Writing my next blog post.");
    var t8 = Tweets(id: 8, name: "Isabella", userName: "bella_travels", Date: "4d", avatar: "avatar8.jpg", like: 600, comment: 40, repost: 50, views: 10200, tweetContent: "Exploring the mountains.");
    var t9 = Tweets(id: 9, name: "William", userName: "will_cooks", Date: "5d", avatar: "avatar9.jpeg", like: 250, comment: 15, repost: 18, views: 5400, tweetContent: "Cooking my favorite dish!");
    var t10 = Tweets(id: 10, name: "Mia", userName: "mia_fashion", Date: "6d", avatar: "avatar10.jpg", like: 700, comment: 50, repost: 60, views: 12000, tweetContent: "Fashion is an art.");

    tweetList.addAll([t1, t2, t3,t4, t5, t6, t7, t8, t9, t10]);
    return tweetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
              AssetImage('images/avatar1.jpg'), // Kendi resim dosyanızın yolunu yazın
            ),
          ),
          title: Image.asset(
            'images/X_logo.jpg', // Kendi logo dosyanızın yolunu yazın
            height: 40,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () {}, // Henüz bir fonksiyon atanmamış
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Premium',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: loadTweet(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var tweetList = snapshot.data;
              return ListView.builder(
                itemCount: tweetList!.length,
                itemBuilder: (context, index) {
                  var tweet = tweetList[index];
                  return Card(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('images/${tweet.avatar}'),
                                radius: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "${tweet.name} ",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: "@${tweet.userName} · ${tweet.Date}",
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      tweet.tweetContent,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildIconText(
                                  Icons.mode_comment_outlined, tweet.comment),
                              _buildIconText(Icons.repeat, tweet.repost),
                              _buildIconText(
                                  Icons.favorite_border, tweet.like),
                              _buildIconText(Icons.graphic_eq, tweet.views),
                              const Icon(Icons.bookmark_border,
                                  color: Colors.grey, size: 20),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget _buildIconText(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 4),
        Text(
          "$count",
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
