// class AnnonScreenTest extends StatefulWidget {
//   @override
//   _AnnonScreenTestState createState() => _AnnonScreenTestState();
// }

// class _AnnonScreenTestState extends State<AnnonScreenTest> {
//   var queryResultSet = [];
//   var tempSearchStore = [];

//   initiateSearch(value) {

       
//     if (value.length == 0) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }

//     var capitalizedValue =
//         value.substring(0, 1).toUpperCase() + value.substring(1);

//     if (queryResultSet.length == 0 && value.length == 1) {
//       SearchService().searchByName(value).then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.documents.length; ++i) {
//           queryResultSet.add(docs.documents[i].data);
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       queryResultSet.forEach((element) {
//         if (element['Book'].startsWith(capitalizedValue)) {
//           setState(() {
//             tempSearchStore.add(element);
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: Text('Firestore search'),
//         ),
//         body: ListView(children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: TextField(
//               onChanged: (val) {
//                 initiateSearch(val);
//               },
//               decoration: InputDecoration(
//                   prefixIcon: IconButton(
//                     color: Colors.black,
//                     icon: Icon(Icons.arrow_back),
//                     iconSize: 20.0,
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   contentPadding: EdgeInsets.only(left: 25.0),
//                   hintText: 'Search by name',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.0))),
//             ),
//           ),
//           SizedBox(height: 10.0),
//           GridView.count(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               crossAxisCount: 2,
//               crossAxisSpacing: 4.0,
//               mainAxisSpacing: 4.0,
//               primary: false,
//               shrinkWrap: true,
//               children: tempSearchStore.map((element) {
//                 return buildResultCard(element);
//               }).toList())
//         ]));
//   }
// }

// Widget buildResultCard(data) {
//   return GestureDetector(
//     onTap: () {
//       print(data['Book']);
//       addData({'Book': 'Zich Boy', 'bookKey': 'Z','recap':'ENDDNDNDNDN'});
//     },
//     child: Card(
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//         elevation: 2.0,
//         child: Container(
//             child: Center(
//                 child: Text(
//           data['Book'],
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20.0,
//           ),
//         )))),
//   );
// }



// // final CollectionReference postsRef = Firestore.instance.collection('/posts');

// // var postID = 1;

// // Post post = new Post(postID, "title", "content");
// // Map<String, dynamic> postData = post.toJson();
// // await postsRef.document(postID).setData(postData);
