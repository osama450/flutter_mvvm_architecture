import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/providers/quote_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void _refresh(BuildContext context) {
  context.refresh(quoteProvider);
  // var a = QuoteService.instance;
  // a.getQuotes();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MVVM With Riverpod'),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: _Quote(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _refresh(context),
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class _Quote extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final quoteApiProvider = watch(quoteProvider);
    return quoteApiProvider.when(
        data: (data) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(30),
            itemCount: data.categories!.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 20,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.categories![index].name!,
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.160,
                            child: Image.network(
                              data.categories![index].image,
                              fit: BoxFit.cover,
                            )))
                  ],
                ),
              );
            },
          );
        },
        error: (_, __) => ErrorScreen(),
        loading: () => CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ));
  }
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Error occured"),
    );
  }
}
