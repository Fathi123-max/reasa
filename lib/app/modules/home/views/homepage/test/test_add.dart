import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reasa/app/modules/home/views/homepage/test/input_fild.dart';

import '../../../../../Model/resident_Model.dart';
import '../../../controllers/firebase_controller.dart';

class AddResidentPage extends StatefulWidget {
  const AddResidentPage({Key? key}) : super(key: key);

  @override
  _AddResidentPageState createState() => _AddResidentPageState();
}

class _AddResidentPageState extends State<AddResidentPage> {
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryTagController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _prizeController = TextEditingController();
  final TextEditingController _perdayNightController = TextEditingController();

  bool _isFavourited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Resident'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputField(
                    labelText: 'Image',
                    controller: _imageController,
                  ),
                  InputField(
                    labelText: 'Name',
                    controller: _nameController,
                  ),
                  InputField(
                    labelText: 'City',
                    controller: _cityController,
                  ),
                  InputField(
                    labelText: 'Country Tag',
                    controller: _countryTagController,
                  ),
                  InputField(
                    labelText: 'Rating',
                    controller: _ratingController,
                    keyboardType: TextInputType.number,
                  ),
                  InputField(
                    labelText: 'Description',
                    controller: _descriptionController,
                    maxLines: 3,
                  ),
                  InputField(
                    labelText: 'Prize',
                    controller: _prizeController,
                    keyboardType: TextInputType.number,
                  ),
                  InputField(
                    labelText: 'Per day/night',
                    controller: _perdayNightController,
                  ),
                  CheckboxListTile(
                    title: Text('Favourite'),
                    value: _isFavourited,
                    onChanged: (value) {
                      setState(() {
                        _isFavourited = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      final firebaseController = Get.find<FirebaseController>();
                      final newResident = Resident(
                        image: _imageController.text,
                        name: _nameController.text,
                        city: _cityController.text,
                        countrytag: _countryTagController.text,
                        rating: double.tryParse(_ratingController.text) ?? 0.0,
                        description: _descriptionController.text,
                        prize: double.tryParse(_prizeController.text) ?? 0.0,
                        perdayNight: _perdayNightController.text,
                        favourite: _isFavourited,
                      );
                      firebaseController.addResident(newResident);
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  )
                ])));
  }
}
