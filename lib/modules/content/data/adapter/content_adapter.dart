import 'package:graduationproject/app/model/content.dart';

abstract class IContentRepository {
  Future<List<Content>> GetContent();
  Future<bool> DelContent(Content content);
  Future<bool> AddContent(Content content);
}
