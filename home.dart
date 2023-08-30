import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridScreen(),
    );
  }
}

class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  int m = 0;
  int n = 0;
  List<List<String>> grid = [];
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobigies Technologies'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Rows:'),
                SizedBox(width: 10),
                Container(
                  width: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        m = int.tryParse(value) ?? 0;
                        grid = List.generate(
                            m, (index) => List<String>.filled(n, ""));
                      });
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text('Columns:'),
                SizedBox(width: 10),
                Container(
                  width: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        n = int.tryParse(value) ?? 0;
                        grid = List.generate(
                            m, (index) => List<String>.filled(n, ""));
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: m,
                itemBuilder: (context, rowIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(n, (colIndex) {
                      return Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        child: TextField(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              grid[rowIndex][colIndex] = value.toUpperCase();
                            });
                          },
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print(grid);
              },
              child: Text('Display Grid'),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value.toUpperCase();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Text',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                searchGrid();
              },
              child: Text('Search in Grid'),
            ),
          ],
        ),
      ),
    );
  }

  void searchGrid() {
    bool found = false;
    for (int row = 0; row < m; row++) {
      for (int col = 0; col < n; col++) {
        if (grid[row][col] == searchText) {
          found = true;
          print('Found "$searchText" at Row: $row, Column: $col');
        }
      }
    }
    if (!found) {
      print('Text "$searchText" not found in the grid.');
    }
  }
}
