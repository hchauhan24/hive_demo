import 'package:flutter/material.dart';
import 'package:hive_demo/hive/boxes.dart';
import 'package:hive_demo/hive/db_fields.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();

  void clear() {
    setState(() {
      boxStudent.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'School Record',
          style: TextStyle(
              color: Color.fromARGB(255, 241, 238, 238), fontSize: 30),
        ),
        backgroundColor: const Color(0xff16003B),
      ),
      backgroundColor: const Color(0xff16003B),
      body: SingleChildScrollView(
        child: Column(children: [
          Card(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    cursorColor: const Color(0xff2E0249),
                    controller: _name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff2E0249),
                        )),
                        hintText: 'Name'),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    cursorColor: const Color(0xff2E0249),
                    controller: _age,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Age',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff2E0249),
                        ))),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      boxStudent.put('key_${_name.text}',
                          Student(name: _name.text, age: int.parse(_age.text)));
                    });
                    _name.clear();
                    _age.clear();
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                        color: Color(0xff2E0249),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            height: 450,
            color: Colors.white,
            child: ListView.builder(
                itemCount: boxStudent.length,
                itemBuilder: (context, index) {
                  Student student = boxStudent.getAt(index);
                  return ListTile(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          boxStudent.deleteAt(index);
                        });
                      },
                    ),
                    title: Text(student.name),
                    subtitle: const Text('name'),
                    trailing: Text('${student.age} yrs'),
                  );
                }),
          ),
          const SizedBox(
            height: 10.0,
          ),
          //const Color(0xffA91079),
          GestureDetector(
              onTap: () => clear(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text(
                    'D E L E T E',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
