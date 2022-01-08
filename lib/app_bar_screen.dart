import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экран перехода 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate to the second screen when tapped.
          },
          child: const Text('назад'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экран перехода 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate back to first screen when tapped.
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}

class _MainScreenState extends State<MainScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Текст кнопки 1',
      style: optionStyle,
    ),
    Text(
      'Текст кнопки 2',
      style: optionStyle,
    ),
    Text(
      'Текст кнопки 3',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo AppBar'),
          actions: <Widget>[
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.account_balance)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.access_alarms_sharp)),
            TextButton(
                onPressed: () {},
                child: const Text('профиль'),
                style: buttonStyle),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Image.network(
                              "https://solaceinfotech.com/blog/wp-content/uploads/2020/08/1_qo6Fo51uAmD3B3d6VfcbAQ-768x230.png"),
                        ),
                        const Text('Заголовок панели NavigationDrawer')
                      ],
                    ),
                  )),
              ListTile(
                  leading: const Icon(Icons.one_k),
                  title: const Text('Переход 1'),
                  onTap: () {
                    Navigator.pushNamed(context, '/first');
                  }),
              ListTile(
                  leading: const Icon(Icons.two_k),
                  title: const Text('Переход 2'),
                  onTap: () {
                    Navigator.pushNamed(context, '/second');
                  }),
              const Divider(), //разделитель
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text('Другие переходы'),
              ),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Переход 3'),
                  onTap: () {
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text('Переход в каталог')));
                  }),
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Кнопка 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Кнопка 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Кнопка 3',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
