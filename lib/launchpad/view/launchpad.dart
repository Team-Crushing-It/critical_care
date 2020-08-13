import 'package:criticalcare/patient/view/patient_tab.dart';
import 'package:flutter/material.dart';

class Launchpad extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => Launchpad());
  }

  @override
  _LaunchpadState createState() => _LaunchpadState();
}

enum Tab { home, schedule, patients, messages, alert }

class _LaunchpadState extends State<Launchpad> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _LaunchpadBody(tab: Tab.values[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.grey,
          type: BottomNavigationBarType.fixed,

          currentIndex: _currentIndex,
          // onTap: (index) => setState(() => _currentIndex = index),
          onTap: (index) => setState(() => print(index)),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              title: Text('Schedule'),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Text('Patients'),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.warning, color: Colors.white),
              title: Text('Alert'),
              backgroundColor: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class _LaunchpadBody extends StatelessWidget {
  const _LaunchpadBody({Key key, this.tab}) : super(key: key);

  final Tab tab;

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case Tab.home:
        // return HomeTab();
        return RichText(
          text: TextSpan(
            text: 'Records',
            style: Theme.of(context).textTheme.headline6,
          ),
        );

      case Tab.schedule:
      // return ScheduleTab();
      case Tab.patients:
        return PatientTab();
      case Tab.messages:
      // return MessagesTab();
      case Tab.alert:
      // return AlertTab();
      default:
        return PatientTab();
    }
  }
}

//  Stack(
//             alignment: Alignment.center,
//             children: [
//               SizedBox(
//                 width: 54,
//                 height: 54,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.4),
//                     borderRadius: const BorderRadius.all(Radius.circular(3)),
//                   ),
//                 ),
//               ),
