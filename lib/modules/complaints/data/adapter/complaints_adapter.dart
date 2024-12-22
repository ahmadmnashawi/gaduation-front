
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/complaints.dart';
import '../../../../app/model/refrence.dart';

abstract class IComplaintsRepository {
    Future<List< Complaint>> GetAllComplaint();
      Future<List< Complaint>>  GetcomplaintUser(int id);
    Future< bool> Putcomplaints(Complaint c);
    Future<bool>Updatecomplaint(Complaint c);
 }