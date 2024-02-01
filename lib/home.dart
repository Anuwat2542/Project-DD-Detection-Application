import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/camara.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime mydatetime = DateTime.now();
  var formatter = DateFormat.yMMMMEEEEd();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'DD Detection Application',
            style: TextStyle(
              color: Color(0xFF189AB4),
            ),
          ),
          backgroundColor: const Color(0xFFD4F1F4),
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerCard(
                    title: formatter.format(mydatetime),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AnotherPage(
                            title: 'เเนะนำการใช้งาน',
                          ),
                        ),
                      );
                    },
                    child: const ContainerCard(
                      title: "เเนะนำการใช้งาน",
                      imagePath: 'assets/images/Vector.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(PageAnimationTransition(
                          page: const CameraApp(),
                          pageAnimationType: BottomToTopTransition()));
                    },
                    child: const Text('เปิดกล้อง'),
                  ),
                ],
              ),
            ),
      )));
}

class ContainerCard extends StatelessWidget {
  final String title;
  final String imagePath; // Add imagePath parameter

  const ContainerCard({Key? key, required this.title, this.imagePath = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
       color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath.isNotEmpty
              ? Image.asset(
                  imagePath,
                  width: 80, // Set width as per your design
                  height: 80, // Set height as per your design
                )
              : const SizedBox
                  .shrink(), // If imagePath is empty, don't show image
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color:Color(0xFF189AB4),
            ),
          ),
        ],
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  final String title;

  const AnotherPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('This is another page!'),
      ),
    );
  }
}
