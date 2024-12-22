// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:getwidget/components/search_bar/gf_search_bar.dart';

// import '../controller/menu.dart';

// class SearchPage extends GetResponsiveView <HomeController>{
//   HomeController controller=Get.put(HomeController());
//     List list = [
//     "Flutter",
//     "React",
//     "Ionic",
//     "Xamarin",
//   ];

//   @override
//   Widget build(BuildContext context) {
//    return Column(
//     children: [

// GFSearchBar(
//   searchList: list,
//   searchQueryBuilder: (query, list) {
//     return list
//         .where((item) =>
//             item.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   },
//   overlaySearchListItemBuilder: (item) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       child: Text(
//         item,
//         style: const TextStyle(fontSize: 18),
//       ),
//     );
//   },
//   onItemSelected: (item) {
//     setState(() {
//       print('$item');
//     });
//   },
// ),
//     ],
//    );

//   }}