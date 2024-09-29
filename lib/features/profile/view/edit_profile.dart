import 'package:ecommerce_app/features/profile/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController favoriteController = TextEditingController();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              title: "name",
              controller: nameController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: "Job",
              controller: jobController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: "age",
              controller: ageController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: "Favorites",
              controller: favoriteController,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      box.write('user_name', nameController.text);
                      box.write('user_job', jobController.text);
                      box.write('user_age', ageController.text);
                      box.write('user_favorites', favoriteController.text);
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ));
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title}",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
