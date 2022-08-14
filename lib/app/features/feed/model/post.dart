import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/app/consts/textconstant.dart';

import '../../../widgets/buttonwidgets.dart';

class Post extends StatefulWidget {
  final String postId;
  final bool imagePost;
  final bool questionPost;
  Post({
    required this.postId,
    required this.imagePost,
    required this.questionPost,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      postId: doc['postId'],
      imagePost: doc['isImagePost'],
      questionPost: doc['isQuestion'],
    );
  }

  @override
  // ignore: no_logic_in_create_state
  _PostState createState() => _PostState(
        // ignore: unnecessary_this
        postId: this.postId,
      );
}

class _PostState extends State<Post> {
  final String postId;

  _PostState({
    required this.postId,
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: Container(
        width: queryData.size.width,
        height: widget.imagePost || widget.questionPost ? 260 : 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          //border: Border.all(color: Colors.red, width: 0.5),
          // image: const DecorationImage(
          //   image: NetworkImage(
          //       "https://firebasestorage.googleapis.com/v0/b/petapp-f989b.appspot.com/o/cat.jpg?alt=media&token=fc433f7c-a79e-4463-8178-7cdf853f6cd1"),
          //   //fit: BoxFit.cover,
          // ),
        ),
        child: Column(children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
            ),
            title: const Text(
              'Name',
              textScaleFactor: 1,
              style: TextStyle(color: Colors.grey),
            ),
            // trailing: Icon(Icons.done),
            subtitle:
                Text('Mother of Anna', style: TextStyle(color: Colors.grey)),
            selected: true,
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: new Container(
              padding: new EdgeInsets.only(right: 13.0),
              child: new Text(
                'Veteriner hekim sorun olmaz dedi ama yine de sorayim. Kedimin asisini geciktirdim sorun olur mu ?',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: postContentStyle,
              ),
            ),
          ),
          widget.questionPost
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      outlinedButtonPostBlue("Katılıyorum", () {}),
                      const SizedBox(
                        width: 15,
                      ),
                      outlinedButtonPostBlue("Katılmıyorum", () {}),
                    ],
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.favorite_border,
                      size: 18, color: Colors.grey),
                  label: Text("Like", style: TextStyle(color: Colors.grey)),
                  onPressed: () {},
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.comment_outlined,
                    size: 18,
                    color: Colors.grey,
                  ),
                  label: Text(
                    "Comment",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.ios_share,
                        size: 18,
                        color: Colors.grey,
                      ),
                      label: Text(
                        "Share",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
