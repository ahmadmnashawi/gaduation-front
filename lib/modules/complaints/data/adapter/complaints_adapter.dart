import '../../../../app/model/complaints.dart';

abstract class IComplaintsRepository {
  Future<List<Complaint>> GetAllComplaint();
  Future<List<Complaint>> GetcomplaintUser(int id);
  Future<bool> Putcomplaints(Complaint c);
  Future<bool> Updatecomplaint(Complaint c);
}
