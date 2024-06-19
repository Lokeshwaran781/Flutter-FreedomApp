import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
final double rating;

StarRating({required this.rating});

@override
_StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
late double _rating;

@override
void initState() {
super.initState();
_rating = widget.rating;
}


@override
Widget build(BuildContext context) {
return Row(
mainAxisSize: MainAxisSize.min,
children: List.generate(5, (index) {
return Icon(
index >= _rating.floor()
? Icons.star_border
: Icons.star,
color: Colors.orange);
}),
);
}
}