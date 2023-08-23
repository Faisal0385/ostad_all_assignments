import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final String? data;

  const ScoreScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(data!),
        ),
        body: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('basketball')
                .doc(data)
                .snapshots(),
            builder:
                (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshort) {
              if (snapshort.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshort.connectionState == ConnectionState.done) {
                if (snapshort.hasError) {
                  return Center(
                    child: Text(snapshort.hasError.toString()),
                  );
                }
              }
              if (snapshort.hasData) {
                final score = snapshort.data!;
                return Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      score.get('team_a'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                    const Text(
                                      'vs',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      score.get('team_b'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ]),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    score.get('score_a').toString(),
                                    style:
                                        Theme.of(context).textTheme.headlineMedium,
                                  ),
                                  const Text(
                                    ':',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    score.get('score_b').toString(),
                                    style:
                                        Theme.of(context).textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Time: ${score.get('time')}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    "Total Time: ${score.get('total_time')}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
