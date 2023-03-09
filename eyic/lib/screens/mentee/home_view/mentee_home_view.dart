import 'package:eyic/api/models/mentee_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../community/communities_home_screen.dart';

final _mentor = [
  MenteeModel(
      uid: "1",
      name: "Vivek Modak",
      email: "vivek.modal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 15,
      role: 'mentor',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "2",
      name: "Manasi Kulkarni",
      email: "manasi.kulkarni@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentor',
      gender: 'female',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "3",
      name: "Mohan Patil",
      email: "mohan.patil@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 18,
      role: 'mentor',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "4",
      name: "Ritika Jha",
      email: "ritika.jha@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 16,
      role: 'mentor',
      gender: 'female',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "5",
      name: "Soha Pal",
      email: "soha.pal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentor',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
];

class MenteeDashboardView extends StatefulWidget {
  const MenteeDashboardView({super.key});

  @override
  State<MenteeDashboardView> createState() => _MenteeDashboardViewState();
}

class _MenteeDashboardViewState extends State<MenteeDashboardView> {
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser != null
        ? FirebaseAuth.instance.currentUser!.uid
        : "";
    Widget _currentView(int index) {
      switch (index) {
        case 0:
          return SingleChildScrollView(
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "{username}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "My mentors",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _mentor.length,
                  itemBuilder: (context, index) {
                    final mentor = _mentor[index];
                    return ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text(mentor.name),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat),
                      ),
                    );
                  },
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "My groups (pinned)",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final mentor = _mentor[index];
                    return ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text(mentor.name),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat),
                      ),
                    );
                  },
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "My courses",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _mentor.length,
                  itemBuilder: (context, index) {
                    final mentor = _mentor[index];
                    return ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text(mentor.name),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  title: const Text("Report Abuse"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("Contact us"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          );
        case 1:
          return CommunitiesHomeScreen();
        default:
          return Text("Kahitr Gandlay");
      }
    }

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Mentorspace"),
      ),
      body: _currentView(_currentScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Communities',
          ),
        ],
        currentIndex: _currentScreenIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
      ),
    );
  }
}
