import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserModel()),
          ChangeNotifierProvider(create: (_) => CounterModel()),
          ChangeNotifierProvider(create: (_) => ThemeModel()),
          ChangeNotifierProvider(create: (_) => TodoListModel()),
        ],
        // child: const MyApp(),
        child: const MyThemeApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          // child: ProductCard(productName: "Chocolate", price: 0.00),
          // child: LikeButton(),
          // child: UserNameForm(),
          // child: CounterPage(),
          // child: VisibilityTogglePage(),
          // child: ItemListPage(),
          // child: ColorBoxPage(),
          // child: GreetingParent(),
          // child: UserWidget(),
          // child: CounterWidget(),
          child: TodoListWidget(),
        ),
      ),
    );
  }
}

//task1.2
class ProductCard extends StatelessWidget {
  final String productName;
  final double price;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//task1.3; task1.4
class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false; // initial state

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked; // flip the value
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        color: _isLiked ? Colors.red : Colors.grey,
        size: 40,
      ),
      onPressed: _toggleLike,
    );
  }
}

//task1.5
class UserNameForm extends StatefulWidget {
  const UserNameForm({super.key});

  @override
  State<UserNameForm> createState() => _UserNameFormState();
}

class _UserNameFormState extends State<UserNameForm> {
  String _userName = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Enter your name",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _userName = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            "Current username: $_userName",
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

//task2.2
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('setState Counter')),
      body: Center(
        child: Text(
          'Count: $_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

//task2.3
class VisibilityTogglePage extends StatefulWidget {
  const VisibilityTogglePage({super.key});

  @override
  State<VisibilityTogglePage> createState() => _VisibilityTogglePageState();
}

class _VisibilityTogglePageState extends State<VisibilityTogglePage> {
  bool _isVisible = true;
  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Visibility Toggle")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isVisible)
              const Text(
                "Hello, I am visible!",
                style: TextStyle(fontSize: 20),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: Text(_isVisible ? "Hide Text" : "Show Text"),
            ),
          ],
        ),
      ),
    );
  }
}

//task2.4
class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final List<String> _items = [];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Items")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Enter item",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.check),
                    title: Text(_items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//task2.5
class ColorBoxPage extends StatefulWidget {
  const ColorBoxPage({super.key});

  @override
  State<ColorBoxPage> createState() => _ColorBoxPageState();
}

class _ColorBoxPageState extends State<ColorBoxPage> {
  Color _boxColor = Colors.grey;

  void _changeColor(Color color) {
    setState(() {
      _boxColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Box")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: _boxColor,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _changeColor(Colors.red),
                child: const Text("Red"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _changeColor(Colors.green),
                child: const Text("Green"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _changeColor(Colors.blue),
                child: const Text("Blue"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//task3.2
class GreetingParent extends StatefulWidget {
  const GreetingParent({super.key});

  @override
  State<GreetingParent> createState() => _GreetingParentState();
}

class _GreetingParentState extends State<GreetingParent> {
  String _name = "Guest";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Greeting(name: _name),
    );
  }
}

class Greeting extends StatelessWidget {
  final String name;
  const Greeting({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello, $name',
      style: const TextStyle(fontSize: 24),
    );
  }
}

//task4.2
class UserModel extends ChangeNotifier {
  String _username = "Guest";
  String get username => _username;

  void changeToAdmin() {
    _username = "Admin";
    notifyListeners();
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Username: ${userModel.username}",
            style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => userModel.changeToAdmin(),
          child: const Text("Change to Admin"),
        ),
      ],
    );
  }
}

//task4.3
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Count: ${counter.count}', style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: counter.increment, child: const Text("+")),
            const SizedBox(width: 10),
            ElevatedButton(
                onPressed: counter.decrement, child: const Text("-")),
            const SizedBox(width: 10),
            ElevatedButton(
                onPressed: counter.reset, child: const Text("Reset")),
          ],
        ),
      ],
    );
  }
}

//task4.4
class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          themeModel.isDarkMode ? "Dark Mode" : "Light Mode",
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        Switch(
          value: themeModel.isDarkMode,
          onChanged: (_) => themeModel.toggleTheme(),
        ),
      ],
    );
  }
}

class MyThemeApp extends StatelessWidget {
  const MyThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: const Scaffold(body: Center(child: ThemeSwitcherWidget())),
        );
      },
    );
  }
}

//task4.5
class TodoListModel extends ChangeNotifier {
  final List<String> _tasks = [];

  List<String> get tasks => _tasks;

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoListModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: "New Task",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    todoList.addTask(_controller.text);
                    _controller.clear();
                  }
                },
                child: const Text("Add"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoList.tasks[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => todoList.removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
