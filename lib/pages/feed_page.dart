import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_app_ui/model/post_model.dart';
import 'package:instagram_app_ui/model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  final List<Post> _posts = [
    Post(
        username: "Brianne",
        userImage: "assets/images/user_1.jpeg",
        postImage: "assets/images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Henri",
        userImage: "assets/images/user_2.jpeg",
        postImage: "assets/images/feed_2.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Mariano",
        userImage: "assets/images/user_3.jpeg",
        postImage: "assets/images/feed_3.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(),
          // #stories watch all
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Stories', style: TextStyle(color: Colors.grey, fontSize: 14),),
                Text('Watch all', style: TextStyle(color: Colors.grey, fontSize: 14),),
              ],
            ),
          ),
          // #storiesList
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: _stories.map((story) {
                return _itemOfStory(story);
              }).toList()
            ),
          ),
          // #postList
          Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _posts.length,
              itemBuilder: (ctx, i){
                return _itemOfPost(_posts[i]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _itemOfStory(Story story){
    return Column(

      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          )
        ),
        const SizedBox(height: 10,),
        Text(story.name, style: const TextStyle(color: Colors.grey),)
      ],
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // #header of the post
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(post.username, style: const TextStyle(color: Colors.grey),)
                  ],
                ),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(SimpleLineIcons.options, color: Colors.grey,)
                )
              ],
            ),
          ),
          // #postImage
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            placeholder: const AssetImage('assets/images/placeholder.png'),
          ),
          // #like comment share
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesome.heart_o, color: Colors.grey,)
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesome.comment_o, color: Colors.grey,)
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesome.send_o, color: Colors.grey,)
                  ),
                ],
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(FontAwesome.bookmark_o, color: Colors.grey,)
              )
            ],
          ),
          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Yessenia,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ]
              ),
            ),
          ),
          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 5,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " ${post.caption}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          // #post date
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              "February 2020",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
