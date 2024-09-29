//import 'dart:html';

import 'package:ecommerce_app/features/profile/view/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final box = GetStorage();
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    box.write('user_name', 'Jalal');
    box.write('user_job', 'Pogrammer');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfile(),
              ));
        },
        child: Container(
          width: 60,
          height: 60,
          child: const Icon(Icons.edit),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade800, Colors.deepPurpleAccent],
              )),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple.shade800,
                        Colors.deepPurpleAccent
                      ],
                    ),
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 110.0,
                    ),
                    const CircleAvatar(
                      radius: 65.0,
                      backgroundImage: AssetImage(''),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(box.read('user_name'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      box.read("user_job"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              left: 20.0,
              right: 20.0,
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Favorites',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "${box.read('favorites')}",
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    )),
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${box.read('usr_age')}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
