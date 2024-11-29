import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

// Dashboard ekrani
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "List of Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccountCard(
                    title: "Bank Account",
                    amount: "\$2500.00",
                    color: Colors.blue,
                    image: "https://via.placeholder.com/100",
                  ),
                  AccountCard(
                    title: "Credit Card",
                    amount: "\$1500.00",
                    color: Colors.pink,
                    image: "https://via.placeholder.com/100",
                  ),
                  AccountCard(
                    title: "Cash",
                    amount: "\$800.00",
                    color: Colors.green,
                    image: "https://via.placeholder.com/100",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Last Records Overview",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              LastRecordItem(
                icon: Icons.shopping_cart,
                title: "Groceries",
                date: "Today",
                amount: "\$250.00",
                color: Colors.orange,
                image: "https://via.placeholder.com/100",
              ),
              LastRecordItem(
                icon: Icons.checkroom,
                title: "Clothes",
                date: "03/04/2018",
                amount: "\$100.00",
                color: Colors.purple,
                image: "https://via.placeholder.com/100",
              ),
              LastRecordItem(
                icon: Icons.home,
                title: "Rental",
                date: "01/03/2018",
                amount: "\$500.00",
                color: Colors.teal,
                image: "https://via.placeholder.com/100",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Notifications ekrani
class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "avatar": "https://via.placeholder.com/100",
      "title": "You received a payment of \$120.00",
      "subtitle": "from Jhon Smith",
      "time": "08:39 AM",
      "buttonText": null,
    },
    {
      "avatar": "https://via.placeholder.com/100",
      "title": "James Smith request a payment of \$450.00",
      "subtitle": "",
      "time": "07:00 AM",
      "buttonText": "Pay",
    },
    {
      "avatar": "https://via.placeholder.com/100",
      "title": "Your new payment method has been added successfully",
      "subtitle": "",
      "time": "03:39 AM",
      "buttonText": null,
    },
    {
      "avatar": "https://via.placeholder.com/100",
      "title": "You received a payment of \$400.00",
      "subtitle": "for Willan Henry",
      "time": "08:39 AM",
      "buttonText": null,
    },
    {
      "avatar": "https://via.placeholder.com/100",
      "title": "Mithun Kumar requested a payment of \$360.00",
      "subtitle": "",
      "time": "7 March 2018",
      "buttonText": "Paid",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(notification['avatar']),
                radius: 25,
              ),
              title: Text(
                notification['title'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (notification['subtitle'] != "")
                    Text(notification['subtitle']),
                  SizedBox(height: 5),
                  Text(
                    notification['time'],
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              trailing: notification['buttonText'] != null
                  ? ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: notification['buttonText'] == "Pay"
                            ? Colors.orange
                            : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(notification['buttonText']!),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

// AccountCard komponenti
class AccountCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;
  final String image;

  AccountCard({
    required this.title,
    required this.amount,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.network(image, height: 40),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            amount,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// LastRecordItem komponenti
class LastRecordItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final Color color;
  final String image;

  LastRecordItem({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 25,
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
      ),
    );
  }
}
