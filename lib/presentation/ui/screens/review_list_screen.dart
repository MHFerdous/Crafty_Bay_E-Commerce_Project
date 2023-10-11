import 'package:flutter/material.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading:  const BackButton(
           color: Colors.black,
         ),
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return reviewCard;
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding get reviewCard {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey.shade100,
        elevation: 3,
        child: const SizedBox(
          height: 150,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'MH Ferdous',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    'description The analogies and problems used in these experiments were not specific to any domain of expertise and used fantasy problems relying only on linguistic descriptions. The semantic descriptions of the devices were varied, but the pictures were identical for both conditions. ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
