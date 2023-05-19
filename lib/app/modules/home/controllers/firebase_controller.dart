import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../Model/resident_Model.dart';

class FirebaseService extends GetxController {
  late CollectionReference<Resident> residentsRef;

  @override
  void onInit() {
    super.onInit();
    residentsRef = FirebaseFirestore.instance
        .collection('residents')
        .withConverter<Resident>(
          fromFirestore: (snapshot, _) =>
              Resident.fromMap(snapshot.data() as Map<String, dynamic>),
          toFirestore: (resident, _) => resident.toMap(),
        );
  }

  // Add methods here to interact with Firebase, such as adding data
  Future<void> addResident(Resident resident) async {
    await residentsRef.add(resident);
  }
}
