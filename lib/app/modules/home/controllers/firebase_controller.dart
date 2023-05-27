import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../Model/resident_Model.dart';

class FirebaseController extends GetxController {
  late CollectionReference<Resident> residentsRef;
  late Query<Resident> residentsRefSearch = FirebaseFirestore.instance
      .collection('residents')
      .where("name", isEqualTo: search.value)
      .withConverter<Resident>(
          fromFirestore: (snapshot, _) => Resident.fromMap(snapshot.data()!),
          toFirestore: (resident, _) => resident.toMap());

  final RxList<Resident> _favourites = RxList<Resident>([]);

  List<Resident> get favlist => _favourites.toList();
  final search = 'b'.obs;
  @override
  void update([List<Object>? ids, bool condition = true]) {
    getDataSearch(search.value);
    print('Update method called with search query: ${search.value}');
    super.update(ids, condition);
  }

  @override
  void onInit() {
    super.onInit();

    getData();
    search.listen((value) {
      getDataSearch(value);
      print('Search query changed to: $value');
    });
  }

  CollectionReference<Resident> getData() {
    return residentsRef = FirebaseFirestore.instance
        .collection('residents')
        .withConverter<Resident>(
            fromFirestore: (snapshot, _) => Resident.fromMap(snapshot.data()!),
            toFirestore: (resident, _) => resident.toMap());
  }

  Query<Resident> getDataSearch(String searchQuery) {
    print('Searching for residents with name: $searchQuery');
    return residentsRefSearch = FirebaseFirestore.instance
        .collection('residents')
        .where("name", arrayContains: searchQuery)
        .withConverter<Resident>(
            fromFirestore: (snapshot, _) => Resident.fromMap(snapshot.data()!),
            toFirestore: (resident, _) => resident.toMap());
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
