import 'package:flutter/material.dart';

class TransportDetailsScreen extends StatefulWidget {
  @override
  _TransportDetailsScreenState createState() => _TransportDetailsScreenState();
}

class _TransportDetailsScreenState extends State<TransportDetailsScreen> {
  // Variables to hold radio button state and form data
  int _loadSelection = 1;

  final TextEditingController _orderIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final List<Map<String, TextEditingController>> _truckDriverDetails = List.generate(
    3,
    (index) => {
      "truckNo": TextEditingController(),
      "driverNo": TextEditingController(),
    },
  );

  @override
  void dispose() {
    _orderIdController.dispose();
    _phoneController.dispose();
    for (var details in _truckDriverDetails) {
      details["truckNo"]?.dispose();
      details["driverNo"]?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "TRANSPORT DETAILS",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.yellow[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildInputField("ORDER ID", _orderIdController),
                _buildInputField("PHONE NUMBER", _phoneController),
                const SizedBox(height: 20),
                _buildTruckDriverDetails(),
                const SizedBox(height: 20),
                Text(
                  "LOAD IN / LOAD OUT",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellow[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<int>(
                          value: 1,
                          groupValue: _loadSelection,
                          onChanged: (value) {
                            setState(() {
                              _loadSelection = value!;
                            });
                          },
                        ),
                        title: Text("LOAD IN", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<int>(
                          value: 2,
                          groupValue: _loadSelection,
                          onChanged: (value) {
                            setState(() {
                              _loadSelection = value!;
                            });
                          },
                        ),
                        title: Text("LOAD OUT", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBottomButton("SAVE", Colors.yellow[700]!, () {
                      _saveOrder(context);
                      Navigator.pop(context);
                    }),
                    _buildBottomButton("BACK", Colors.grey, () {
                      Navigator.pop(context);
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.yellow[700],
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow[700]!),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow[700]!),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTruckDriverDetails() {
    return Column(
      children: List.generate(
        3,
        (index) => Row(
          children: [
            Expanded(
              child: _buildInputField(
                  "Truck no.", _truckDriverDetails[index]["truckNo"]!),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildInputField(
                  "Driver no.", _truckDriverDetails[index]["driverNo"]!),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: Colors.yellow[700],
              child: Icon(Icons.person, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  void _saveOrder(BuildContext context) {
    // Show scaffold message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Order Placed!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
