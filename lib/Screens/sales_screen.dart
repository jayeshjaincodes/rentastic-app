import 'package:flutter/material.dart';
import 'package:rentastic/Screens/chairSales_screen.dart';
import 'package:rentastic/Screens/drawer.dart';
import 'package:rentastic/Screens/tableSales_screen.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
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
          Center(
            child: Text('SALES',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: Colors.yellow[300],
                  fontWeight: FontWeight.w200,
                )),
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
                      minimumSize:
                          Size(screenWidth * 0.4, screenHeight * 0.045)),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      Text(
                        'Relevant',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      minimumSize:
                          Size(screenWidth * 0.4, screenHeight * 0.045)),
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
                      )
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                CategoryButton(
                  label: 'CHAIR',
                  imageUrl: 'assets/chair.png',
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => ChairsalesScreen(), ));
  
                  },
                ),
                CategoryButton(
                  label: 'TABLE',
                  imageUrl: 'assets/table.png',
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => TablesalesScreen(), ));
                  },
                ),
                CategoryButton(
                  label: 'SOFA',
                  imageUrl: 'assets/sofa.png',
                  onPressed: () {},
                ),
                CategoryButton(
                  label: 'CONSOLES',
                  imageUrl: 'assets/consoles.png',
                  onPressed: () {},
                ),
                CategoryButton(
                  label: 'PROPS',
                  imageUrl: 'assets/props.png',
                  onPressed: () {},
                ),
                CategoryButton(
                  label: 'COFFEE TABLE',
                  imageUrl: 'assets/coffee_table.png',
                  onPressed: () {},
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

  const CategoryButton({
    Key? key,
    required this.label,
    required this.imageUrl,
    required this.onPressed,
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
            Text(
              label,
              style: TextStyle(
                color: Colors.yellow.shade700,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
