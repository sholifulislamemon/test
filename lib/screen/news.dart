import 'package:flutter/material.dart';
import 'package:jobtest/Model/NewsModel.dart';
import 'package:jobtest/services/api%20link.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  Api_services api_services = Api_services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex api "),
      ),
      body: FutureBuilder<NewsModel>(
        future: api_services.getNews(),
        builder: (context, snapshot) {
                     try {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  // Display an error message if there's an error in fetching data
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData ||
                    snapshot.data?.articles == null ||
                    snapshot.data!.articles!.isEmpty) {
                  // Display a message if there's no data or if articles are null/empty
                  return Center(
                    child: Text('No articles available.'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data!.articles![index].title ??
                            'No title'),

                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data!.articles![index].urlToImage.toString()),
                        ),
                      );
                    },
                  );
                }
              } catch (e) {
                // Handle unexpected errors
                return Center(
                  child: Text('Something went wrong: $e'),
                );
              }
            },
                ),
    );
  }
}
