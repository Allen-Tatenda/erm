import 'package:erm/widgets/navigation_method.dart';
import 'package:flutter/material.dart';
import 'Pages/homepage/widgets/app_bar.dart';

class Entrance extends StatefulWidget {
  const Entrance({super.key});

  @override
  State<Entrance> createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      navigationStream.sink.add(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const AppBarWidget(),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  //image: DecorationImage(image: NetworkImage(''))
                ),
                child: Text(
                  'App Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  // Add navigation logic here
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Add navigation logic here
                },
              ),
              ListTile(
                title: const Text('Item 3'),
                onTap: () {
                  // Add navigation logic here
                },
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.black12.withOpacity(.01),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
                child: StreamBuilder<int>(
                    stream: navigationStream.stream,
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasData) {
                        return myPages[snapshot.data!];
                        //return RiskRegisterPage();
                        //return const LossOfKeyEmployee();
                      }
                      return const SizedBox.shrink();
                    })),
          ),
        ));
  }
}
