import 'package:criticalcare/patient/view/patient_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:criticalcare/authentication/authentication.dart';

class Launchpad extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => Launchpad());
  }

  @override
  _LaunchpadState createState() => _LaunchpadState();
}

enum Tab { home, schedule, patients, messages, alert }

class _LaunchpadState extends State<Launchpad> {
  final _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _LaunchpadBody(tab: Tab.values[_currentIndex]),
        bottomNavigationBar: _MyBottomNavBar(tab: Tab.values[_currentIndex]),
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
      // return RichText(
      //   text: TextSpan(
      //     text: 'Home',
      //     style: Theme.of(context).textTheme.headline6,
      //   ),
      // );

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

class _MyBottomNavBar extends StatelessWidget {
  const _MyBottomNavBar({Key key, this.tab}) : super(key: key);

  final Tab tab;

  @override
  Widget build(BuildContext context) {
    final boxWidth = (MediaQuery.of(context).size.width) / 5;
    return Row(children: [
      // =========================== home tab===============================
      InkWell(
        onTap: () {
          context
              .bloc<AuthenticationBloc>()
              .add(AuthenticationLogoutRequested());
        },
        child: SizedBox(
          width: boxWidth,
          height: boxWidth - 10,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).backgroundColor,
              ),
              color: tab == Tab.home
                  ? Theme.of(context).toggleableActiveColor
                  : const Color(0xFFCCCCCC),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: boxWidth - 7,
                  height: boxWidth - 17,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Image.asset(
                          'assets/img/icon_home.png',
                          key: const Key('icon_home'),
                          width: 42,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      bottom: 0,
                      child: RichText(
                        text: TextSpan(
                          text: 'Home',
                          style: TextStyle(
                            color: tab == Tab.home
                                ? const Color(0xFF05FF2D)
                                : Theme.of(context).backgroundColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // =========================== Schedule tab===============================
      SizedBox(
        width: boxWidth,
        height: boxWidth - 10,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).backgroundColor,
            ),
            color: tab == Tab.schedule
                ? Theme.of(context).toggleableActiveColor
                : const Color(0xFFCCCCCC),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: boxWidth - 7,
                height: boxWidth - 17,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset(
                        'assets/img/icon_schedule.png',
                        key: const Key('icon_schedule'),
                        width: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    bottom: 0,
                    child: RichText(
                      text: TextSpan(
                        text: 'Schedule',
                        style: TextStyle(
                          color: tab == Tab.schedule
                              ? const Color(0xFF05FF2D)
                              : Theme.of(context).backgroundColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // =========================== Patient tab===============================
      SizedBox(
        width: boxWidth,
        height: boxWidth - 10,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).backgroundColor,
            ),
            color: tab == Tab.patients
                ? Theme.of(context).toggleableActiveColor
                : const Color(0xFFCCCCCC),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: boxWidth - 7,
                height: boxWidth - 17,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset(
                        'assets/img/icon_patients.png',
                        key: const Key('icon_patient'),
                        width: boxWidth - 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    bottom: 0,
                    child: RichText(
                      text: TextSpan(
                        text: 'Patients',
                        style: TextStyle(
                          color: tab == Tab.patients
                              ? const Color(0xFF05FF2D)
                              : Theme.of(context).backgroundColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // =========================== Messages tab===============================
      SizedBox(
        width: boxWidth,
        height: boxWidth - 10,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).backgroundColor,
            ),
            color: tab == Tab.messages
                ? Theme.of(context).toggleableActiveColor
                : const Color(0xFFCCCCCC),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: boxWidth - 7,
                height: boxWidth - 17,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset(
                        'assets/img/icon_messages.png',
                        key: const Key('icon_messages'),
                        width: boxWidth - 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    bottom: 0,
                    child: RichText(
                      text: TextSpan(
                        text: 'Messages',
                        style: TextStyle(
                          color: tab == Tab.messages
                              ? const Color(0xFF05FF2D)
                              : Theme.of(context).backgroundColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // =========================== Alert tab===============================
      SizedBox(
        width: boxWidth,
        height: boxWidth - 10,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).backgroundColor,
            ),
            color: Colors.red,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: boxWidth - 10,
                height: boxWidth - 20,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset(
                        'assets/img/icon_alert.png',
                        key: const Key('icon_alert'),
                        width: boxWidth - 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    bottom: 0,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Alert',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

// BottomNavigationBar(
//           // backgroundColor: Theme.of(context).primaryColor,
//         backgroundColor: Colors.grey,
//           type: BottomNavigationBarType.fixed,

//           currentIndex: _currentIndex,
//           // onTap: (index) => setState(() => _currentIndex = index),
//           onTap: (index) => setState(() => print(index)),
//           items: [
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               title: Text('Home'),
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.schedule),
//               title: Text('Schedule'),
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.dashboard),
//               title: Text('Patients'),
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.message),
//               title: Text('Messages'),
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.warning, color: Colors.white),
//               title: Text('Alert'),
//               backgroundColor: Colors.redAccent,
//             ),
//           ],
//         ),
