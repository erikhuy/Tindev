// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:tindev/theme/colors.dart';

// class Skill {
//   final int id;
//   final String name;

//   Skill({
//     this.id,
//     this.name,
//   });
// }

// class SignUpForDeveloper4 extends StatefulWidget {
//   @override
//   _SignUpForDeveloper4State createState() => _SignUpForDeveloper4State();
// }

// class _SignUpForDeveloper4State extends State<SignUpForDeveloper4> {
//   static List<Skill> _skills = [
//     Skill(id: 1, name: "Agile"),
//     Skill(id: 2, name: "Android"),
//     Skill(id: 3, name: "Angular"),
//     Skill(id: 4, name: "ASP.NET"),
//     Skill(id: 5, name: "AWS"),
//     Skill(id: 6, name: "Blockchain"),
//     Skill(id: 7, name: "Bridge Engineer"),
//     Skill(id: 8, name: "Business Analyst"),
//     Skill(id: 9, name: "C#"),
//     Skill(id: 10, name: "C++"),
//     Skill(id: 11, name: "CSS"),
//     Skill(id: 12, name: "Database"),
//     Skill(id: 13, name: "DevOps"),
//     Skill(id: 14, name: "Django"),
//     Skill(id: 15, name: "HTML5"),
//     Skill(id: 16, name: "iOS"),
//     Skill(id: 17, name: "Java"),
//     Skill(id: 18, name: "JavaScript"),
//     Skill(id: 19, name: "JQuery"),
//     Skill(id: 20, name: "Linux"),
//     Skill(id: 21, name: "MySQL"),
//     Skill(id: 22, name: ".NET"),
//     Skill(id: 23, name: "VueJS"),
//     Skill(id: 24, name: "Wordpress"),
//     Skill(id: 25, name: "ReactJS"),
//     Skill(id: 26, name: "React Native"),
//   ];
//   final _items = _skills
//       .map((skill) => MultiSelectItem<Skill>(skill, skill.name))
//       .toList();
//   //List<Skill> _selectedSkills = [];
//   List<Skill> _selectedSkills2 = [];
//   List<Skill> _selectedSkills3 = [];
//   //List<Skill> _selectedSkills4 = [];
//   List<Skill> _selectedSkills5 = [];
//   final _multiSelectKey = GlobalKey<FormFieldState>();

//   @override
//   void initState() {
//     _selectedSkills5 = _skills;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         leading: Navigator.canPop(context)
//             ? IconButton(
//                 padding: EdgeInsets.fromLTRB(8, 24.0, 0.0, 0.0),
//                 icon: Icon(
//                   Icons.arrow_back_ios_new_rounded,
//                   color: Colors.blue[600],
//                   size: 32,
//                 ),
//                 onPressed: () => Navigator.of(context).pop(),
//               )
//             : null,
//       ),
//       body: Container(
//         width: double.infinity,
//         height: size.height,
//         child: Stack(
//           alignment: Alignment.topLeft,
//           children: <Widget>[
//             SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(height: size.height * 0.14),
//                   Container(
//                     padding: EdgeInsets.only(left: 15),
//                     child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         "Skill",
//                         style: TextStyle(
//                           fontSize: 48.0,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.blue[600],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 15),
//                     child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         "Select",
//                         style: TextStyle(
//                           fontSize: 48.0,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.blue[600],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.05),
//                   Container(
                    
//                     width: size.width * 0.8,
//                     child: 
//                     MultiSelectBottomSheetField<Skill>(
//                       key: _multiSelectKey,
//                       initialChildSize: 0.7,
//                       maxChildSize: 0.95,
//                       title: Text("Skills"),
//                       buttonText: Text("Select Skills"),
//                       items: _items,
//                       searchable: true,
//                       validator: (values) {
//                         if (values == null || values.isEmpty) {
//                           return "*Select at least one";
//                         }
//                         List<String> names = values.map((e) => e.name).toList();
//                         // if (names.contains("Frog")) {
//                         //   return "Frogs are weird!";
//                         // }
//                         return null;
//                       },
//                       onConfirm: (values) {
//                         setState(() {
//                           _selectedSkills3 = values;
//                         });
//                         _multiSelectKey.currentState.validate();
//                       },
//                       chipDisplay: MultiSelectChipDisplay(
//                         onTap: (item) {
//                           setState(() {
//                             _selectedSkills3.remove(item);
//                           });
//                           _multiSelectKey.currentState.validate();
//                         },
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(32.0),
//                             side: BorderSide(width: 1, color: Colors.blue)),
//                         chipColor: Colors.blue[600],
//                         textStyle: TextStyle(color: white),
//                       ),
//                     ),
                  
//                   ),
                
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
