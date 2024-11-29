import 'package:flutter/material.dart';
import 'package:rentastic/Screens/drawer.dart';

class CartScreen extends StatefulWidget {
  final String imageUrl; // Image URL of the selected chair or table
  final int rate; // Rate of the selected chair or table

  const CartScreen({super.key, required this.imageUrl, required this.rate});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Controllers for editable text fields
  final quantityController = TextEditingController(text: '1'); // Default quantity
  final labourController = TextEditingController(text: '500'); // Default labour cost
  final transportController = TextEditingController(text: '100'); // Default transport cost
  final offerController = TextEditingController(text: '0'); // Default offer amount

  // Calculated values
  int total = 0;
  int totalWithoutTax = 0;
  int totalWithTax = 0;
  int finalAmount = 0;

  // Tax percentage
  final double taxPercentage = 0.18; // 18% tax

  @override
  void initState() {
    super.initState();
    _calculate(); // Perform initial calculation
  }

  // Function to calculate totals
  void _calculate() {
    int quantity = int.tryParse(quantityController.text) ?? 0;
    int labour = int.tryParse(labourController.text) ?? 0;
    int transport = int.tryParse(transportController.text) ?? 0;
    int offer = int.tryParse(offerController.text) ?? 0;

    total = quantity * widget.rate;
    totalWithoutTax = total + labour + transport;
    totalWithTax = (totalWithoutTax * (1 + taxPercentage)).toInt();
    finalAmount = totalWithTax - offer;

    setState(() {}); // Update UI
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // To handle overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the selected chair/table image
              Center(
                child: Image.asset(
                  widget.imageUrl,
                  height: screenHeight * 0.3,
                ),
              ),
              const SizedBox(height: 20),
              // Display the rate
              Text(
                'Rate: ₹${widget.rate}',
                style: TextStyle(fontSize: 18, color: Colors.yellow[300]),
              ),
              const SizedBox(height: 20),
              // Editable fields
              _buildInputRow('Quantity:', quantityController, onChanged: _calculate),
              _buildInputRow('Labour Cost:', labourController, onChanged: _calculate),
              _buildInputRow('Transport Cost:', transportController, onChanged: _calculate),
              const Divider(),
              // Read-only display fields
              _buildDisplayRow('Total:', '₹$total'),
              _buildDisplayRow('Total Without Tax:', '₹$totalWithoutTax'),
              _buildDisplayRow('Total With Tax (18%):', '₹$totalWithTax'),
              const Divider(),
              // Offer input
              _buildInputRow('Offer Amount:', offerController, onChanged: _calculate),
              // Final amount display
              _buildDisplayRow('Final Amount:', '₹$finalAmount'),
              const Divider(),
              const SizedBox(height: 20),
              // Create Work Order button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // Show SnackBar with green background and "Order placed!" message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Order placed!',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Create Work Order',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build an input row with a label and TextField
  Widget _buildInputRow(String label, TextEditingController controller, {required VoidCallback onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Label
          Text(
            label,
            style: TextStyle(color: Colors.yellow[300], fontSize: 16),
          ),
          // Editable TextField
          SizedBox(
            width: 150,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.yellow[300]), // Text color inside TextField
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow.shade300),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              onChanged: (value) => onChanged(),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build a display row with a label and Text
  Widget _buildDisplayRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Label
          Text(
            label,
            style: TextStyle(color: Colors.yellow[300], fontSize: 16),
          ),
          // Displayed value
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
