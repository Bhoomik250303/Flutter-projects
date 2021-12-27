import 'package:flutter/material.dart';

class ImageScrollView extends StatefulWidget {
  const ImageScrollView({Key? key}) : super(key: key);

  @override
  _ImageScrollViewState createState() => _ImageScrollViewState();
}

class _ImageScrollViewState extends State<ImageScrollView> {
  List<String> _listOfImageLink = [
    "https://images.prismic.io/frameworkmarketplace/cca31de3-3b75-4932-af96-7646b7eba6c7__DSC3630-Edit-cropped.jpg?auto=compress,format",
    "https://images.unsplash.com/photo-1618424181497-157f25b6ddd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFwdG9wJTIwY29tcHV0ZXJ8ZW58MHx8MHx8&w=1000&q=80",
    "https://images.prismic.io/frameworkmarketplace/cca31de3-3b75-4932-af96-7646b7eba6c7__DSC3630-Edit-cropped.jpg?auto=compress,format",
    "https://images.prismic.io/frameworkmarketplace/cca31de3-3b75-4932-af96-7646b7eba6c7__DSC3630-Edit-cropped.jpg?auto=compress,format"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        itemCount: _listOfImageLink.length,
        itemBuilder: (BuildContext context, int idx) {
          return Container(
            margin: EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Image.network(_listOfImageLink[idx]),
          );
        },
      ),
    );
  }
}
