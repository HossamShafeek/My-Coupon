import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/authentication/data/models/authentication_model.dart';
import 'package:my_coupon/features/menu/data/repository/menu_repository.dart';

class MenuRepositoryImplementation extends MenuRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, AuthenticationModel>> getUserData({
    required String userId,
  }) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Users').doc(userId).get();
      AuthenticationModel user = AuthenticationModel.fromJson(result.data()!);
      return Right(user);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateUserData(
      {required String userId,
      required String firstName,
      required String lastName}) async{
    try {
          await firebaseFirestore.collection('Users').doc(userId).update({
            'first_name':firstName,
            'last_name':lastName,
          });
      return const Right('تم تحديث البيانات بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
