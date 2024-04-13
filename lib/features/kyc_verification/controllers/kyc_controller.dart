import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motodealz/features/kyc_verification/model/kyc_data_model.dart';

class KYCController extends GetxController {
  final CollectionReference kycCollection =
      FirebaseFirestore.instance.collection('KYC');

  Future<void> uploadKYCData(String userId, KYCData kycData) async {
    await kycCollection.doc(userId).set(kycData.toJson());
  }
}
