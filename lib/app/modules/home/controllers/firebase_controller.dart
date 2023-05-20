import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../Model/resident_Model.dart';

class FirebaseController extends GetxController {
  late CollectionReference<Resident> residentsRef;
  RxList<Resident> _favourites = RxList<Resident>([]);

  List<Resident> get favlist => _favourites.toList();

  @override
  void onInit() {
    super.onInit();
    residentsRef = FirebaseFirestore.instance
        .collection('residents')
        .withConverter<Resident>(
          fromFirestore: (snapshot, _) => Resident.fromMap(snapshot.data()!),
          toFirestore: (resident, _) => resident.toMap(),
        );
  }

  void toggleFavourite(Resident resident) {
    if (_favourites.contains(resident)) {
      _favourites.remove(resident);
    } else {
      _favourites.add(resident);
    }
  }

  bool isFavourited(Resident resident) {
    return _favourites.contains(resident);
  }

  // Add other methods to interact with Firebase here
  // Add methods here to interact with Firebase, such as adding data
  Future<void> addResident(Resident resident) async {
    await residentsRef.add(resident);
  }
}
