import 'package:flutter/material.dart';
import 'package:rentastic/Screens/cart_screen.dart';
import 'package:rentastic/Screens/drawer.dart';

class TablesalesScreen extends StatefulWidget {
  const TablesalesScreen({super.key});

  @override
  State<TablesalesScreen> createState() => _TablesalesScreenState();
}

class _TablesalesScreenState extends State<TablesalesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.yellow.shade700,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: screenHeight * 0.12,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_left_sharp,
                  size: 38,
                  color: Colors.yellow[300],
                ),
              ),
              Text(
                'TABLE SALES',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: Colors.yellow[300],
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  minimumSize: Size(screenWidth * 0.06, screenHeight * 0.045),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  minimumSize: Size(screenWidth * 0.35, screenHeight * 0.045),
                ),
                onPressed: () {},
                child: Text(
                  'Com.Order',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  minimumSize: Size(screenWidth * 0.06, screenHeight * 0.045),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                // First Table
                CategoryButton(
                  label: '202155',
                  imageUrl: 'assets/table.png',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          imageUrl: 'assets/table.png',
                          rate: 202155,
                        ),
                      ),
                    );
                  },
                  quantity: '10',
                ),
                // Second Table
                CategoryButton(
                  label: '2365',
                  imageUrl: 'assets/table1.png',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          imageUrl: 'assets/table1.png',
                          rate: 2365,
                        ),
                      ),
                    );
                  },
                  quantity: '15',
                ),
                // Third Table
                CategoryButton(
                  label: '15325',
                  imageUrl: 'assets/table2.png',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          imageUrl: 'assets/table2.png',
                          rate: 15325,
                        ),
                      ),
                    );
                  },
                  quantity: '20',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final String imageUrl;
  final VoidCallback onPressed;
  final String quantity;

  const CategoryButton({
    Key? key,
    required this.label,
    required this.imageUrl,
    required this.onPressed,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          minimumSize: Size(150, 150),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 110,
              width: 110,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'QTY - $quantity',
                  style: TextStyle(
                    backgroundColor: Colors.black45,
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
