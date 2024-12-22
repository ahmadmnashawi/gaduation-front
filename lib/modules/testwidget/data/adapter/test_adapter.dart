
import 'package:graduationproject/app/model/Answer.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/content.dart';
import '../../../../app/model/refrence.dart';
import '../../../../app/model/test.dart';
import '../../../../app/model/testDto.dart';

abstract class ITestRepository {
   Future<List< Content>> GetTestsContent();
 Future<List< TestDto>> GetTestsForContent(int idcontent);
   Future<bool> AddQution(Test test); 
   Future<bool> AddAnswer(Answer a); 
    Future<int?> GetIdTest(String test); 
    // Future<List< Test>> GetAllTypeTest();
      // Future< Test?> GetTest(int id);
      //  Future<bool> DelRefrence(Reference reference);
      //   Future<bool> AddRefrence(Reference reference); 
 }