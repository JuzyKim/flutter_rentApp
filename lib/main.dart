// import 'package:flutter/material.dart';
//
// class MyTitleWidget extends StatelessWidget {
//   final String titleText;
//
//   MyTitleWidget({required this.titleText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       alignment: Alignment.center,
//       child: Text(
//         titleText,
//         style: TextStyle(
//           fontSize: 40,
//           fontStyle: FontStyle.normal,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
//
// final List<String> users = ["Где арендовать", "Когда"];
//
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           MyTitleWidget(
//             titleText: 'Посуточная аренда недвижимости',
//           ),
//           Container(
//             width: 500, // Width of the box
//             height: 140, // Height of the box
//             margin: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color grey
//               borderRadius: BorderRadius.circular(10), // Rounded corners
//             ),
//             child: ListView.separated(
//               padding: const EdgeInsets.all(10),
//               itemCount: users.length,
//               separatorBuilder: (BuildContext context, int index) => Divider(),
//               itemBuilder: (BuildContext context, int index) {
//                 // Define the icons
//                 IconData iconData = index == 0 ? Icons.language : Icons.access_time;
//                 Color iconColor = Colors.blue; // Set icon color to blue
//
//                 return ListTile(
//                   title: Text(
//                     users[index],
//                     style: TextStyle(
//                       fontSize: 22,
//                       color: Colors.blue, // Set text color to blue
//                       fontWeight: FontWeight.bold, // Set text to bold
//                     ),
//                   ),
//                   leading: Icon(
//                     iconData,
//                     color: iconColor,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   ));
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        scaffoldBackgroundColor: Colors.white, // White background color for the main screen
      ),
      home: const MyHomePage(title: 'Посуточная аренда недвижимости'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<String> users = ["Где арендовать", "Когда"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white, // White background color for the app bar
      ),
      body: Column(
          children: [
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 500, // Width of the box
        height: 140, // Height of the box
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Background color grey
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: users.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            // Define the icons
            IconData iconData = index == 0 ? Icons.language : Icons.access_time;
            Color iconColor = Colors.blue; // Set icon color to blue

            return ListTile(
              title: Text(
                users[index],
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue, // Set text color to blue
                  fontWeight: FontWeight.bold, // Set text to bold
                ),
              ),
              leading: Icon(
                iconData,
                color: iconColor,
              ),
            );
          },
        ),
      ),
    ),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
    width: 400,
    height: 100,
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
    color: Colors.blue.withOpacity(0.1), // Almost invisible blue background color for the container
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.home_outlined, color: Colors.blue,),
    SizedBox(width: 8),
    Text(
    'Мои заселения',
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700),
    ),
    ],
    ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Предстоящие и предыдущие',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    ],
    ),
    ),
    ),
          ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.key),
            label: 'Снять',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode_sharp),
            label: 'Сдать',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white, // White background color for the bottom navigation bar
      ),
    );
  }
}