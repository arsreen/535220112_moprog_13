import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print('Back button pressed');
            },
          ),
          title: Text('Godrej'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search button pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print('Shopping cart button pressed');
              },
            ),
          ],
        ),
        body: Container(
          height: double.infinity, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Text(
                'Semua Produk',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Button 1 pressed');
                    },
                    child: Text('Promosi'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Button 2 pressed');
                    },
                    child: Text('Nama Produk'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Button 3 pressed');
                    },
                    child: Text('Terlaris'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 10, 
                  itemBuilder: (BuildContext context, int index) {
                    return ProductDisplay(
                      productName: 'Product $index',
                      price: '\$${(index + 1) * 10}', 
                      onPressed: () {
                        print('+ Add to Cart');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDisplay extends StatelessWidget {
  final String productName;
  final String price;
  final VoidCallback onPressed;

  ProductDisplay({
    required this.productName,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Center(
              child: Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi9DrSTuXGfqugZTs6bY25SDaWoQvlcBuRE0-ER5fBW3z-rQf4JjyTxsI-DYthXZED_iDJ8q0t1cL5A22rzE9sLfquirQUn51Y_MOmHVGeI2DU_s7Nb2XRVHsB0Cf45ncfirLnpgY4l_w-Dhb7_kgbyH7uHGBCBKn_9Af1pZrPNi3Jz-E3Qh23E5LUE/s2394/IMG_5300_jpg%202.JPG', // Replace with the actual image URL
                height: 400,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(price,
              style: TextStyle(
                color: Colors.red,
              ),),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('+ Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
