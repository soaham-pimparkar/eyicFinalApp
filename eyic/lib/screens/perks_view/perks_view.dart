import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/course_model.dart';
import 'package:eyic/screens/perks_view/perks_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/models/perks_model.dart';

class PerksView extends StatelessWidget {
  const PerksView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPerks(),
      builder: (context, AsyncSnapshot<List<PerksModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //print("snapshot is waiting");
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
        if (snapshot.hasData) {
          //print("snapshot has data called");
          final perks = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text("MentorSpace perks"),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              itemCount: perks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      PerksDetailView(
                        perk: perks[index],
                      ),
                    );
                  },
                  child: Card(
                    child: SizedBox(
                      height: 150,
                      child: Row(
                        children: [
                          const Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Placeholder(),
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(perks[index].companyName),
                                  subtitle: Text(perks[index].tagline),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(
                                      PerksDetailView(
                                        perk: perks[index],
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.arrow_forward),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        print('container returned');
        return Container();
      },
    );
  }
}

Future<List<PerksModel>> _getPerks() async {
  //print("get courses future called");
  final data = await FirebaseFirestore.instance.collection("perks").get();
  return data.docs.map((e) => PerksModel.fromMap(e.data())).toList();
}
