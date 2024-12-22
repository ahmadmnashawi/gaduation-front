import '../../../../app/model/content.dart';
import '../../../../app/model/refrence.dart';
import '../../../../app/model/refrenceDto.dart';

abstract class IRefrenceRepository {
  Future<List<Reference>> GetAllRefrence();
  Future<List<Reference>> GetRefrencelink(int id);
  Future<bool> DelRefrence(Reference reference);
  Future<bool> AddRefrence(Reference reference);
  Future<List<RefrenceDto>> GeAllrefrenceAdmain();
   Future<List<Content>> GetARefrenceConternt();
}
